## Description

The storage account container containing the activity log export should not be publicly accessible.

Allowing public access to activity log content may aid an adversary in identifying weaknesses in the affected account's use or configuration.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Search for `Storage Accounts` to access Storage account blade.
3. Click on the storage account name.
4. Click on `Configuration` under settings.
5. Select `Enabled` under "Allow Blob public access".

### From Azure CLI

```bash
az storage container set-permission --name insights-activity-logs --account- name <Storage Account Name> --sas-token <SAS token> --public-access off
```

### From PowerShell

Create a new storage account context for the storage account holding the `insight- activity-logs` container making sure to use a valid `Shared Access Signature (SAS)` token.

```bash
$context = New-AzStorageContext -StorageAccountName <storage account name> - SasToken "<SAS token>"
```

Change the `insights-activity-logs` container public access to `off`

```bash
Set-AzStorageContainerAcl -Context $context -Name "insights-activity-logs" - Permission Off -PassThru
```

### Default Value

By default, public access is set to null (allowing only private access) for a container with activity log export.
