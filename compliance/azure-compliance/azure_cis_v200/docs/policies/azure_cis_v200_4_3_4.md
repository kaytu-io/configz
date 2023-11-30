## Description

Enable `log_disconnections` on `PostgreSQL Servers`.

Enabling `log_disconnections` helps PostgreSQL Database to `Logs end of a session`, including duration, which in turn generates query and error logs. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Go to `Azure Database` for `PostgreSQL servers`.
3. For each database, click on `Server parameters`.
4. Search for `log_disconnections`.
5. Click `ON` and save.

### From Azure CLI

Use the below command to update `log_disconnections` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName> --server-name <serverName> --name log_connections --value on
```

### From Powershell

Use the below command to update `log_disconnections` configuration.

```bash
Update-AzPostgreSqlConfiguration -ResourceGroupName <ResourceGroupName> - ServerName <ServerName> -Name log_disconnections -Value on
```

### Default Value

By default `log_disconnections` is disabled (set to `off`).
