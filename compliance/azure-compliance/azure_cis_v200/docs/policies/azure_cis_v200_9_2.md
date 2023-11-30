## Description

Azure Web Apps allows sites to run under both HTTP and HTTPS by default. Web apps can be accessed by anyone using non-secure HTTP links by default. Non-secure HTTP requests can be restricted and all HTTP requests redirected to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic.

Enabling HTTPS-only traffic will redirect all non-secure HTTP requests to HTTPS ports. HTTPS uses the TLS/SSL protocol to provide a secure connection which is both encrypted and authenticated. It is therefore important to support HTTPS for the security benefits.

## Remediation

### From Azure Portal

1. Login to Azure Portal using [https://portal.azure.com](https://portal.azure.com).
2. Go to `App Services`.
3. Click on each App.
4. Under `Setting` section, Click on `TLS/SSL settings`.
5. Under the `Bindings` pane, set `HTTPS Only` to `On` under `Protocol Settings` section.

### From Azure CLI

To set HTTPS-only traffic value for an existing app, run the following command:

```bash
az webapp update --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> -- set httpsOnly=true
```

### From Powershell

```bash
Set-AzWebApp -ResourceGroupName <RESOURCE_GROUP_NAME> -Name <APP_NAME> - HttpsOnly $true
```

### Default Value

By default, HTTPS-only feature will be disabled when a new app is created using the command-line tool or Azure Portal console.
