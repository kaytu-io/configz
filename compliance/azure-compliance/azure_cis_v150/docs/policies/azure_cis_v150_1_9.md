## Description

Ensure that users are notified on their primary and secondary emails on password resets.

User notification on password reset is a passive way of confirming password reset activity. It helps the user to recognize unauthorized password reset activities.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Select `Users`
4. Select `Password reset`
5. Select `Notification`
6. Set `Notify users on password resets?` to `Yes`

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

### Default Value

By default, `Notify users on password resets?` is set to "Yes".