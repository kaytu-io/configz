## Description

Do not allow users to remember multi-factor authentication on devices.

Remembering Multi-Factor Authentication (MFA) for devices and browsers allows users to have the option to bypass MFA for a set number of days after performing a successful sign-in using MFA. This can enhance usability by minimizing the number of times a user may need to perform two-step verification on the same device. However, if an account or device is compromised, remembering MFA for trusted devices may affect security. Hence, it is recommended that users not be allowed to bypass MFA.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select the `Azure Active Directory` blade
3. Then `Users`
4. Select `All Users`
5. Click on `Per-User MFA` button on the top bar
6. Select User(s) and click on `Manage user settings` in the right column
7. Enable `Restore multi-factor authentication on all remembered devices`

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

### Default Value

By default, `Restore multi-factor authentication on all remembered devices` is disabled.