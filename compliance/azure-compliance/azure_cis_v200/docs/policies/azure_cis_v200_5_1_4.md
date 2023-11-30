## Description

Storage accounts with the activity log exports can be configured to use Customer Managed Keys (CMK).

Configuring the storage account with the activity log export container to use CMKs provides additional confidentiality controls on log data, as a given user must have read permission on the corresponding storage account and must be granted decrypt permission by the CMK.

## Remediation

### From Azure Portal

1. Navigate to the Storage accounts blade.
2. Click on the storage account.
3. Under `Security + networking`, click `Encryption`.
4. Next to `Encryption type`, select `Customer-managed keys`.
5. Complete the steps to configure a customer-managed key for encryption of the storage account.

### From Azure CLI

```bash
az storage account update --name <name of the storage account> --resource- group <resource group for a storage account> --encryption-key- source=Microsoft.Keyvault --encryption-key-vault <Key Vault URI> -- encryption-key-name <KeyName> --encryption-key-version <Key Version>
```

### From PowerShell

```bash
Set-AzStorageAccount -ResourceGroupName <resource group name> -Name <storage account name> -KeyvaultEncryption -KeyVaultUri <key vault URI> -KeyName <key name>
```

### Default Value

By default, for a storage account `keySource` is set to `Microsoft.Storage` allowing encryption with vendor Managed key and not a Customer Managed Key.