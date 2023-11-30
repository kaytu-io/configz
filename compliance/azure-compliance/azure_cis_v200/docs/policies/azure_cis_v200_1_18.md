## Description

Restricts group creation to administrators with permissions only.

Self-service group management enables users to create and manage security groups or Office 365 groups in Azure Active Directory (Azure AD). Unless a business requires this day-to-day delegation for some users, self-service group management should be disabled.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Groups`.
4. Select `General` under `Settings`.
5. Ensure that `Restrict user ability to access groups features in the Access Panel` is set to `Yes`.

### Default Value

By default, `Restrict user ability to access groups features in the Access Pane` is set to `No`.
