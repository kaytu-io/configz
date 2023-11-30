## Description

**WARNING:** Role assignments disappear when a Key Vault has been deleted (soft- delete) and recovered. Afterwards it will be required to recreate all role assignments. This is a limitation of the soft-delete feature across all Azure services.

The new RBAC permissions model for Key Vaults enables a much finer grained access control for key vault secrets, keys, certificates, etc., than the vault access policy. This in turn will permit the use of privileged identity management over these roles, thus securing the key vaults with JIT Access management.

## Remediation

### From Azure Portal

Key Vaults can be configured to use `Azure role-based access control` on creation. For existing Key Vaults:

1. From Azure Home open the Portal Menu in the top left corner.
2. Select `Key Vaults`.
3. Open every Key Vault you wish to audit.
4. Select `Access configuration`.
5. Set the Permission model radio button to `Azure role-based access control`, taking note of the warning message.
6. Click `Save`.
7. Select `Access Control (IAM)`.
8. Select the `Role Assignments` tab.
9. Reapply permissions as needed to groups or users.

### Default Value

The default value for Access control in Key Vaults is Vault Policy.
