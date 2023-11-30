## Description

Enable `log_checkpoints` on `PostgreSQ`L Servers.

Enabling `log_checkpoints` helps the PostgreSQL Database to Log each checkpoint in turn generates query and error logs. However, access to transaction logs is not supported. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Azure Console

1. From Azure Home select the Portal Menu
2. Go to `Azure Database` for `PostgreSQL` server
3. For each database, click on `Server parameters`
4. Search for `log_checkpoints`.
5. Click `ON` and save.

### From Azure CLI

Use the below command to update `log_checkpoints` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName> --
server-name <serverName> --name log_checkpoints --value on
```

### Default Value

By default `log_checkpoints` is disabled.