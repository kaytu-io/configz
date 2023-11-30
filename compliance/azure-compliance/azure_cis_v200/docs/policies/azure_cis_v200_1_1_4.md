## Description

Do not allow users to remember multi-factor authentication on devices.

Remembering Multi-Factor Authentication (MFA) for devices and browsers allows users to have the option to bypass MFA for a set number of days after performing a successful sign-in using MFA. This can enhance usability by minimizing the number of times a user may need to perform two-step verification on the same device. However, if an account or device is compromised, remembering MFA for trusted devices may affect security. Hence, it is recommended that users not be allowed to bypass MFA.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Users`.
4. Click the `Per-user MFA` button on the top bar.
5. Click on `service settings`.
6. Uncheck the box next to `Allow users to remember multi-factor authentication on devices they trust`.

### Default Value

By default, `Allow users to remember multi-factor authentication on devices they trust` is disabled.
