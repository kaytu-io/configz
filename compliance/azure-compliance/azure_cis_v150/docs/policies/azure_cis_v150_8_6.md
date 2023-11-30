## Description

**WARNING:** Role assignments disappear when a Key Vault has been deleted (soft- delete) and recovered. Afterwards it will be required to recreate all role assignments. This is a limitation of the soft-delete feature across all Azure services.

The new RBAC permissions model for Key Vaults enables a much finer grained access control for key vault secrets, keys, certificates, etc., than the vault access policy. This in turn will permit the use of privileged identity management over these roles, thus securing the key vaults with JIT Access management.

## Remediation

### From Azure Portal

Key Vaults on creation can be set to use `Azure role-based control`. For already create Key Vaults :

1. From Azure Home open the Portal Menu in the top left corner.
2. Select Key Vaults
3. View the Key Vaults within your subscription.
4. Open every Key Vault you wish to audit.
5. Select Access Policies
6. Set the Permission Model radio button should be set to `Azure role-based control`.
7. In the screen note the warning message, then click save if you have determined the impact.
8. Select `Access Control(IAM)`.
9. Select the `Role Assignments` in the horizontal row.
10. Reapply permissions as needed to groups or users.

### Default Value

The default value for Access control in Key Vaults is Vault Policy.