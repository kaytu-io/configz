## Description

Require administrators to provide consent for applications before use.

If Azure Active Directory is running as an identity provider for third-party applications, permissions and consent should be limited to administrators or pre-approved. Malicious applications may attempt to exfiltrate data or abuse privileged user accounts.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Enterprise Applications`.
4. Select `Consent and permissions`.
5. Select `User consent settings`.
6. Set `User consent for applications` to `Do not allow user consent`.
7. Click save

### Default Value

By default, `Users consent for applications` is set to `Allow user consent for apps`.