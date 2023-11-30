## Description

Ensure `log_retention_days` on `PostgreSQL Servers` is set to an appropriate value.

Configuring `log_retention_days` determines the duration in days that `Azure Database for PostgreSQL` retains log files. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Go to `Azure Database for PostgreSQL servers`.
3. For each database, click on `Server parameters`.
4. Search for `log_retention_days`.
5. Input a value between 4 and 7 (inclusive) and click `Save`.

### From Azure CLI

Use the below command to update `log_retention_days` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName> --server-name <serverName> --name log_retention_days --value <4-7>
```

### From Powershell

Use the below command to update `log_retention_days` configuration.

```bash
Update-AzPostgreSqlConfiguration -ResourceGroupName <ResourceGroupName> - ServerName <ServerName> -Name log_retention_days -Value <4-7>
```

### Default Value

By default `log_retention_days` is set to `3`.
