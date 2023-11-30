## Description

This recommendation extends guest access review by utilizing the Azure AD Privileged Identity Management feature provided in Azure AD Premium P2.

Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data.

Guest users in the Azure AD are generally required for collaboration purposes in Office 365, and may also be required for Azure functions in enterprises with multiple Azure tenants. Guest users should be reviewed on a regular basis, at least annually. Guest users should not be granted administrative roles where possible.

Guest users are typically added outside your employee on-boarding/off-boarding process and could potentially be overlooked indefinitely, leading to a potential vulnerability.

Guest users should be reviewed on a monthly basis to ensure that inactive and unneeded accounts are removed.

## Remediation

### From Azure Portal

1. From the Azure Portal home page click the portal menu in the top left.
2. Select `Azure Active Directory`
3. Select `Users` in the left column under the `Manage` heading.
4. Next to the search box select the `filter` option.
5. Search for and select `User Type`
6. In the third drop down `Value` select `Guest`.
7. Review the guest users in your Active Directory.
8. For those you wish to delete, select the checkbox on the left then the `Delete` option in the top row.

### From Azure CLI

With the information from the audit procedure, to remove a Guest user run the following command with their User Principal Value.

```bash
Remove-AzureADUser -ObjectId "<UserPrincipalName@emailaddress.com"
```

### From Azure Powershell

With the information from the audit procedure, to remove a Guest user run the following command with their User Principal Value.

```bash
Remove-AzureADUser -ObjectId "<UserPrincipalName@emailaddress.com>"
```

### Default Value

By default no guest users are created.
