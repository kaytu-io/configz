# analytics

All the files with `json` extension in assets will be considered `Asset Metrics`.

ID of each metric will be the file name so be careful of changing them as you will loose the historical data.
Each metric MUST contain these fields:
- connectors: array[connector] (connector: `AWS` or `Azure`)
- name: string
- query: string

### query
`query` is scoped for one connection. in order to make it happen it MUST have either `${CONNECTION_ID}` or `${ACCOUNT_ID}` in the query so that it can be scoped to that specific connection.

`${CONNECTION_ID}` is for ID of connection in Kaytu, `${ACCOUNT_ID}` is provider-level account id (e.g. AccountID in AWS or SubscriptionID in Azure)

Also it MUST only return one row containing one column which is the count.

Example:
```
{
  "connectors": ["AWS", "Azure"],
  "name": "VMs",
  "query": "select count(*) from kaytu_resources where resource_type IN ('aws::ec2::instance', 'microsoft.compute/virtualmachines') and source_id = '${ACCOUNT_ID}'"
}
```

