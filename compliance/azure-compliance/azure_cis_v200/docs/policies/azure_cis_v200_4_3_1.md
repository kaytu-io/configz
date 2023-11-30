## Description

Enable `SSL connection` on `PostgreSQL` Servers.

`SSL connectivity` helps to provide a new layer of security by connecting database server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between database server and client applications helps protect against "man in the middle" attacks by encrypting the data stream between the server and application.

## Remediation

### From Azure Portal

1. Login to Azure Portal using [https://portal.azure.com](https://portal.azure.com)
2. Go to Azure Database for `PostgreSQL server`.
3. For each database, click on `Connection security`.
4. In `SSL` settings, click on `ENABLED` to enforce SSL connections.
5. Click `Save`.

### From Azure CLI

Use the below command to `enforce ssl connection` for `PostgreSQL` Database.

```bash
az postgres server update --resource-group <resourceGroupName> --name
<serverName> --ssl-enforcement Enabled
```

### From PowerShell

```bash
Update-AzPostgreSqlServer -ResourceGroupName <ResourceGroupName > -ServerName <ServerName> -SslEnforcement Enabled
```

### Default Value

By default, secure connectivity is enforced, but some application frameworks may not enable it during deployment.
