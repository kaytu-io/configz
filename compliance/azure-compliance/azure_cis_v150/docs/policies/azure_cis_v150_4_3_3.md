## Description

Enable `log_connections` on `PostgreSQL` Servers.

Enabling `log_connections` helps PostgreSQL Database to log attempted connection tothe server, as well as successful completion of client authentication. Log data can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance

## Remediation

### From Azure Console

1. Login to Azure Portal using https://portal.azure.com
2. Go to `Azure Database` for `PostgreSQL server`
3. For each database, click on `Server parameters`
4. Search for `log_connections`.
5. Click `ON` and save.

### From Azure CLI

Use the below command to update `log_connections` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName>
--server-name <serverName> --name log_connections --value on
```

### Default Value

By default `log_connections` is disabled (set to off).