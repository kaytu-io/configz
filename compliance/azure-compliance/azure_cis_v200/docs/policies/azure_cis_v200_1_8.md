## Description

Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0.

This setting is necessary if you have setup 'Require users to register when signing in option'. If authentication re-confirmation is disabled, registered users will never be prompted to re-confirm their existing authentication information. If the authentication information for a user changes, such as a phone number or email, then the password reset information for that user reverts to the previously registered authentication information.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Then `Users`.
4. Select `Password reset`.
5. Then `Registration`.
6. Set the `Number of days before users are asked to re-confirm their authentication information` to your organization-defined frequency.

### Default Value

By default, `the Number of days before users are asked to re-confirm their authentication information` is set to "180 days".
