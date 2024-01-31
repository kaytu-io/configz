# Configz
This repository contains all the default workspace configuration files for Kaytu.
You can create your custom workspace by forking this repository and changing the files.

Here is the repository structure:


* [assets](#assets): contains all the asset metric definitions (part of analytics)
* [spend](#spend): contains all the spend metric definitions (part of analytics)
* [finder](#finder): defines the default queries that are suggested to users in query page
* [insights](#insights): contains all the insights workspace runs
* [compliance](#compliance): contains all the compliance benchmarks and controls
* connection_group: contains all the connection group definitions
* resource-collection: contains all the resource collection definitions

## assets
### How to define:
All the files with `yaml` extension in assets will be considered `Asset Metrics`.

ID of each metric will be the file name so be careful of changing them as you will lose the historical data.
Each metric must contain these fields:
- connectors: `array[connector]` (connector: `AWS` or `Azure`)
- name: `string`
- query: `string`
- status: `string` (active or inactive)
- tags: `map[string][]string`
#### query
`query` should be grouped by `connection_id` and `region` and must select both of them along with the metric value with the name `count`.
we recommend using `kaytu_lookup` table to define the query. `kaytu_lookup` is a table that contains some bare information about all the resources in the system.
If you need more specific information about the resources, use the resource specific tables like `aws_ec2_instance` or `aws_s3_bucket`.

<details>
<summary><b>Example</b></summary>

```yaml
connectors:
- AWS
name: ACM Public Certificate (SSL/TLS)
query: select connection_id, region, count(*) from kaytu_lookup where resource_type = 'aws::certificatemanager::certificate' group by 1,2;
status: inactive
tags:
  category:
  - Security
```
</details>

#### tags
`tags` is a map of string to array of strings. Some keys like `category` are used to group the metrics in the UI.

## spend
### How to define:
All the files with `yaml` extension in spend will be considered `Spend Metrics`.

ID of each metric will be the file name so be careful of changing them as you will lose the historical data.

Each metric must contain these fields:
- connectors: `array[connector]` (connector: `AWS` or `Azure`)
- name: `string`
- query: `string`
- status: `string` (active or inactive)
- tables: `array[string]`
- tags: `map[string][]string`

#### query
`query` should be grouped by `kaytu_account_id` and `date` and must select both of them along with the metric value with the name `sum`.
The tables that contain cost data are `aws_cost_by_service_daily` and `azure_costmanagement_costbyresourcetype` for AWS and Azure respectively.

<details>
<summary><b>Example</b></summary>

```yaml
connectors:
- AWS
name: Amazon Elastic Compute Cloud - Compute
query: SELECT kaytu_account_id, period_start::date::text as date, sum(amortized_cost_amount) FROM aws_cost_by_service_daily WHERE service = 'Amazon Elastic Compute Cloud - Compute' group by 1,2;
status: active
tables:
- Amazon Elastic Compute Cloud - Compute
tags:
  category:
  - Compute
```
</details>

#### tables
`tables` is an array of strings that contains the names of the sub-table 
(refer to where clause in the example) that contains the cost data.
#### tags
`tags` is a map of string to array of strings. 
Some keys like `category` are used to group the metrics in the UI.

## finder
### How to define:
All the files with `yaml` extension in finder will be considered `Finder Queries`.
The ones in the `popular` folder will be shown in popular tab and the ones 
in the `other` folder will be shown in other tab.

Each query must contain these fields:
- connectors: `array[connector]` (connector: `AWS` or `Azure`)
- query: `string`
- title: `string`

#### query
`query` is the SQL query against the Kaytu query engine, there are no limitations on this query.

<details>
<summary><b>Example</b></summary>

```yaml
connectors:
- AWS
- Azure
query: |-
  select 
    case
      when resource_type like 'aws::%' then 'AWS'
      else 'Azure'
    end as provider, 
    c.name as cloud_account_name, 
    c.id as _discovered_provider_id,
    r.name as name, 
    r.region as location, 
    r.connection_id as _kaytu_connection_id,
    r.resource_id as _resource_id,
    r.resource_type as _resource_type,
    r.created_at as _last_discovered
  from 
    kaytu_resources r inner join kaytu_connections c on r.connection_id = c.kaytu_id
  where 
    resource_type IN ('aws::ec2::vpc', 'microsoft.network/virtualnetworks')
title: Cloud Networks
```
</details>

## insights
### How to define:
All the files with `yaml` extension in `insights/insights` directory
will be considered an `insight`. You can also group insights 
together by defining a group in `insights/insgiht_groups` directory.

Each insight must contain these fields:
- Connector: `connector` (connector: `AWS` or `Azure`)
- Description: `string`
- Enabled: `boolean`
- ID: `uint` (must be unique across all the insights)
- LongTitle: `string`
- Query: 
  - Engine: `string` - the query engine that is used to run the query, currently only `odysseus-v0.0.1` is supported
  - ListOfTables: `array[string]` - list of tables that are used in the query
  - PrimaryTable: `string` - the table that the result of the query is from
  - QueryToExecute: `string` - the query itself, no limitations
  - Tags: `map[string][]string`

<details>
<summary><b>Example</b></summary>

```yaml
Connector: AWS
Description: List users that have inline policies
Enabled: true
ID: 9
LongTitle: List users that have inline policies
Query:
  Engine: odysseus-v0.0.1
  ListOfTables:
  - aws_iam_user
  PrimaryTable: aws_iam_user
  QueryToExecute: |-
    select
      name as user_name,
      inline_policies, account_id, kaytu_account_id, kaytu_resource_id
    from
      aws_iam_user
    where
      inline_policies is not null;
ShortTitle: Users with Inline Policies
Tags:
  category:
  - Security
  - Technical Debt
```
</details>

## compliance
Compliance consists of two parts: `benchmarks` and `controls`.
### How to define controls:
All the files with `yaml` extension in `compliance/controls` directory will be considered a `control`.
Each control must contain these fields:
- Description: `string`
- ID: `string` (must be unique across all the controls)
- Managed: `boolean`
- Query:
  - Connector: `connector` (connector: `AWS` or `Azure`)
  - Engine: `string` - the query engine that is used to run the query, currently only `odysseus-v0.0.1` is supported
  - ListOfTables: `array[string]` - list of tables that are used in the query
  - PrimaryTable: `string` - the table that the result of the query is from
  - QueryToExecute: `string` - the query itself, no limitations
  - Severity: `string` - the severity of the control one of `none`, `low`, `medium`, `high`, `critical`
  - Tags: `map[string][]string`

<details>
<summary><b>Example</b></summary>

```yaml
Description: Ensure if an Amazon API Gateway API stage is using a WAF Web ACL. This rule is non compliant if an AWS WAF Web ACL is not used.
ID: aws_apigateway_stage_use_waf_web_acl
Managed: true
Query:
  Connector: AWS
  Engine: odysseus-v0.0.1
  ListOfTables:
  - aws_api_gateway_stage
  PrimaryTable: aws_api_gateway_stage
  QueryToExecute: |
    select
      arn as resource,
      kaytu_account_id as kaytu_account_id,
      kaytu_resource_id as kaytu_resource_id,
      case
        when web_acl_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when web_acl_arn is not null then title || ' associated with WAF web ACL.'
        else title || ' not associated with WAF web ACL.'
      end as reason
      
      , region, account_id
    from
      aws_api_gateway_stage;
Severity: ""
Tags:
  category:
  - Compliance
  cis_controls_v8_ig1:
  - "true"
  cisa_cyber_essentials:
  - "true"
  fedramp_low_rev_4:
  - "true"
  fedramp_moderate_rev_4:
  - "true"
  ffiec:
  - "true"
  nist_800_171_rev_2:
  - "true"
  nist_800_53_rev_5:
  - "true"
  nist_csf:
  - "true"
  pci_dss_v321:
  - "true"
  plugin:
  - aws
  rbi_cyber_security:
  - "true"
  service:
  - AWS/APIGateway
Title: API Gateway stage should be associated with waf
```
</details>

### How to define benchmarks:
All the files with `yaml` extension in `compliance/benchmarks` directory will be considered a `benchmark`.
One thing to note here is that benchmarks can be nested into each other, with 
root benchmarks being the ones that are not nested into any other benchmark
and the ones that we do assignments on, it is recommended to follow the directory structure
provided in this repository and mark root benchmarks with `root` in their name.

Each benchmark must contain these fields:
- AutoAssign: `boolean` - only applicable for root benchmarks, whether to assign the benchmark to all the accounts by default or not
- Baseline: `boolean` - only applicable for root benchmarks, whether to assign the benchmark to all the accounts by default or not
- Children: `array[string]` - list of child benchmarks, note that child benchmarks also can have children and the children must be defined in a `children.yaml` file
- Connector: `connector` (connector: `AWS` or `Azure`)
- Controls: `array[string]` - list of controls that are part of this benchmark, note that controls can be part of multiple benchmarks and they must be defined in `compliance/controls` directory
- Description: `string`
- Enabled: `boolean`
- ID: `string` (must be unique across all the benchmarks)
- Managed: `boolean`
- Tags: `map[string][]string`
- Title: `string`

<details>
<summary><b>Example</b></summary>

```yaml
ID: aws_cis_v200_3
Title: 3 Logging
DisplayCode: ""
Connector: AWS
Description: ""
Children: []
Tags:
  category:
    - Compliance
  cis:
    - "true"
  cis_section_id:
    - "3"
  cis_version:
    - v2.0.0
  plugin:
    - aws
  service:
    - AWS
  source_git:
    - https://github.com/turbot/steampipe-mod-aws-compliance.git
  type:
    - Benchmark
Managed: true
Enabled: true
AutoAssign: false
Baseline: true
Controls:
  - aws_cloudtrail_multi_region_read_write_enabled
  - aws_cloudtrail_trail_validation_enabled
  - aws_cloudtrail_bucket_not_public
  - aws_cloudtrail_trail_integrated_with_logs
  - aws_config_enabled_all_regions
  - aws_cloudtrail_s3_logging_enabled
  - aws_cloudtrail_trail_logs_encrypted_with_kms_cmk
  - aws_kms_cmk_rotation_enabled
  - aws_vpc_flow_logs_enabled
  - aws_cloudtrail_s3_object_write_events_audit_enabled
  - aws_cloudtrail_s3_object_read_events_audit_enabled
```
</details>