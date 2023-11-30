## Description

Restrict security group management to administrators only.

Restricting security group management to administrators only prohibits users from making changes to security groups. This ensures that security groups are appropriately managed and their management is not delegated to non-administrators.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Then `Groups`.
4. Select `General` in `settings`.
5. Set `Owners can manage group membership requests in the Access Panel` to `No`.

### Default Value

By default, `Owners can manage group membership requests in the Access Panel` is set to `No`.