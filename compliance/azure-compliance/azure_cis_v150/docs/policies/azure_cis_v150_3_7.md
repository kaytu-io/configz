## Description

Disallowing public access for a storage account overrides the public access settings for individual containers in that storage account.

The default configuration for a storage account permits a user with appropriate permissions to configure public (anonymous) access to containers and blobs in a storage account. Keep in mind that public access to a container is always turned off by default and must be explicitly configured to permit anonymous requests. It grants read- only access to these resources without sharing the account key, and without requiring a shared access signature. It is recommended not to provide anonymous access to blob containers until, and unless, it is strongly desired. A shared access signature token or Azure AD RBAC should be used for providing controlled and timed access to blob containers. If no anonymous access is needed on any container in the storage account, it’s recommended to set allowBlobPublicAccess false at the account level, which forbids any container to accept anonymous access in the future.

## Remediation

### From Azure Console

First, follow Microsoft documentation and create shared access signature tokens for your blob containers. Then,

1. Go to `Storage Accounts`
2. For each storage account, go to `Allow Blob public access` in Configuration
3. Set `Disabled` if no anonymous access is needed on the storage account

Alternatively, if some containers must be made public (so 'Allow Blob public access' is enabled),

1. For each storage account, go to `Containers` under the `Data Storage` heading
2. For each private container, click `Access policy`
3. Set `Public access level` to `Private (no anonymous access)`

### From Azure CLI

First, follow Microsoft documentation and created shared access signature tokens for your blob containers. Then, if no anonymous access is wanted (as recommended here),

1. Set 'Allow Blob Public Access' to false on the storage account

```bash
az storage account update --name <storage-account> --resource-group
<resource-group> --allow-blob-public-access false
```
Alternatively, if some containers must be made public (so 'Allow Blob public access' is
enabled),

1. Identify the container name from the audit command
2. Set the permission for public access to private(off) for the above container name, using the below command

```bash
az storage container set-permission --name <containerName> --public-access
off --account-name <accountName> --account-key <accountKey>
```

### Default Value

By default, `Public access level` is set to `Private (no anonymous access)` for blob containers. By default, AllowBlobPublicAccess is set to Null (allow in effect) for storage account.