## Description

Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data.

Work with external partners, large or small, even if they don't have Azure AD or an IT department. A simple invitation and redemption process lets partners use their own credentials to access your company's resources as a guest user.

Guest users in every subscription should be review on a regular basis to ensure that inactive and unneeded accounts are removed.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Select `Users`
4. Click on `Add filter`
5. Select `User type`
6. Select `Guest` from the Value drop down
7. Click `Apply`
8. Delete all `Guest` users that are no longer required or are inactive

### From Azure CLI

Before deleting the user, set it to inactive using the ID from the Audit Procedure to determine if there are any dependent systems.

```bash
az ad user update --id <exampleaccountid@domain.com> --account-enabled {false}
```

After determining that there are no dependent systems delete the user.

```bash
Remove-AzureADUser -ObjectId <exampleaccountid@domain.com>
```

### From Azure PowerShell

Before deleting the user, set it to inactive using the ID from the Audit Procedure to determine if there are any dependent systems.

```bash
Set-AzureADUser -ObjectId "<exampleaccountid@domain.com>" -AccountEnabled false
```

After determining that there are no dependent systems delete the user.

```bash
PS C:\>Remove-AzureADUser -ObjectId <exampleaccountid@domain.com>
```

### Default Value

By default no guest users are created.
