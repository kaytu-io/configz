## Description

Some Azure services that interact with storage accounts operate from networks that can't be granted access through network rules. To help this type of service work as intended, allow the set of trusted Azure services to bypass the network rules. These services will then use strong authentication to access the storage account. If the Allow trusted Azure services exception is enabled, the following services are granted access to the storage account: Azure Backup, Azure Site Recovery, Azure DevTest Labs, Azure Event Grid, Azure Event Hubs, Azure Networking, Azure Monitor, and Azure SQL Data Warehouse (when registered in the subscription).

Turning on firewall rules for storage account will block access to incoming requests for data, including from other Azure services. We can re-enable this functionality by enabling "`Trusted Azure Services`" through networking exceptions.

## Remediation

### From Azure Console

1. Go to `Storage Accounts`.
2. For each storage account, Click on the `Networking` blade.
3. Click on the `Firewalls and virtual networks` heading.
4. Ensure that `Enabled from selected virtual networks and IP addresses` is selected.
5. Under the 'Exceptions' label, enable check box for `Allow Azure services on the trusted services list to access this storage account`.
6. Click Save to apply your changes.

### From Azure CLI

Use the below command to update `Azure services`.

```bash
az storage account update --name <StorageAccountName> --resource-group <resourceGroupName> --bypass AzureServices
```

### Default Value

By default, Storage Accounts will accept connections from clients on any network.

