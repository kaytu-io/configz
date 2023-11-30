## Description

Enable sensitive data encryption at rest using Customer Managed Keys rather than Microsoft Managed keys.

By default, data in the storage account is encrypted using Microsoft Managed Keys at rest. All Azure Storage resources are encrypted, including blobs, disks, files, queues, and tables. All object metadata is also encrypted. If you want to control and manage this encryption key yourself, however, you can specify a customer-managed key. That key is used to protect and control access to the key that encrypts your data. You can also choose to automatically update the key version used for Azure Storage encryption whenever a new version is available in the associated Key Vault.

## Remediation

### From Azure Portal

1. Go to `Storage Accounts`
2. For each storage account, go to `Encryption`
3. Set Customer Managed Keys
4. Select the Encryption key and enter the appropriate setting value
5. Click `Save`

### Default Value

By default, Encryption type is set to Microsoft Managed Keys.