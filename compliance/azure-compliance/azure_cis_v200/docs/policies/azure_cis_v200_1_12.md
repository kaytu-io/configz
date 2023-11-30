## Description

Allow users to provide consent for selected permissions when a request is coming from a verified publisher.

If Azure Active Directory is running as an identity provider for third-party applications, permissions and consent should be limited to administrators or pre-approved. Malicious applications may attempt to exfiltrate data or abuse privileged user accounts.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Enterprise Applications`.
4. Select `Consent and permissions`.
5. Select `User consent settings`.
6. Under `User consent for applications`, select `Allow user consent for apps from verified publishers, for selected permissions`.
7. Select `Save`.

### From PowerShell

```bash
Connect-MsolService
Set-MsolCompanyInformation --UsersPermissionToUserConsentToAppEnabled $False
```

### Default Value

By default, `User consent for applications` is set to `Allow user consent for apps`.
