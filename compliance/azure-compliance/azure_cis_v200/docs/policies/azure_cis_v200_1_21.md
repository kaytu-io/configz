## Description

Restrict Microsoft 365 group creation to administrators only.

Restricting Microsoft 365 group creation to administrators only ensures that creation of Microsoft 365 groups is controlled by the administrator. Appropriate groups should be created and managed by the administrator and group creation rights should not be delegated to any other user.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Then `Groups`.
4. Select `General` in `settings`.
5. Set `Users can create Microsoft 365 groups in Azure portals, API or PowerShell` to `No`.

### Default Value

By default, `Users can create Microsoft 365 groups in Azure portals, API or PowerShell` is set to `Yes`.