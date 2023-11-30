## Description

TLS connectivity helps to provide a new layer of security, by connecting database server to client applications using Transport Layer Security (TLS). Enforcing TLS connections between database server and client applications helps protect against "man in the middle" attacks by encrypting the data stream between the server and application.

## Remediation

### From Console

1. Login to [Azure Portal](https://portal.azure.com)
2. Go to Azure Database `for MySQL flexible servers`
3. For each database, click on `Server parameters` under `Settings`
4. In the search box, type in `tls_version`
5. Click on the VALUE dropdown, and ensure only `TLSV1.2` is selected for tls_version

### From Command Line

Use the below command to set MYSQL flexible databases to used version 1.2 for the
`tls_version` parameter.

```bash
az mysql flexible-server parameter set --name tls_version --resourcegroup <resourceGroupName> --server-name <serverName> --value TLSV1.2
```
