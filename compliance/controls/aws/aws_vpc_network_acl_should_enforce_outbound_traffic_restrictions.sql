with bad_rules as (
    select network_acl_id,
        count(*) as num_bad_rules
    from aws_vpc_network_acl,
        jsonb_array_elements(entries) as att
    where att->>'Egress' = 'true' -- as per aws egress = false indicates the ingress
        and (
            att->>'CidrBlock' = '0.0.0.0/0'
            or att->>'Ipv6CidrBlock' = '::/0'
        )
        and att->>'RuleAction' = 'allow'
        and att->>'Protocol' = '-1' -- all traffic
        and att->>'PortRange' is null
    group by network_acl_id
)
select 'arn:' || acl.partition || ':ec2:' || acl.region || ':' || acl.account_id || ':network-acl/' || acl.network_acl_id as resource,
    acl.kaytu_account_id as kaytu_account_id,
    acl.kaytu_resource_id as kaytu_resource_id,
    case
        when bad_rules.network_acl_id is null then 'ok'
        else 'alarm'
    end as status,
    case
        when bad_rules.network_acl_id is null then acl.network_acl_id || ' does not contains default ingress rule'
        else acl.network_acl_id || ' contains ' || bad_rules.num_bad_rules || ' default ingress rule'
    end as reason,
    acl.region,
    acl.account_id
from aws_vpc_network_acl as acl
    left join bad_rules on bad_rules.network_acl_id = acl.network_acl_id;