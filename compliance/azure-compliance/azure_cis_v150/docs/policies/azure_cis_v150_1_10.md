## Description

Ensure that all administrators are notified if any other administrator resets their password.

Administrator accounts are sensitive. Any password reset activity notification, when sent to all administrators, ensures that all administrators can passively confirm if such a reset is a common pattern within their group. For example, if all administrators change their password every 30 days, any password reset activity before that may require administrator(s) to evaluate any unusual activity and confirm its origin.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users`
4. Select `Password reset`
5. Then `Notification`
6. Set `Notify all admins when other admins reset their password?` to `Yes`

Please **note** that at this point of time, there is no Azure CLI or other API commands
available to programmatically conduct security configuration for this recommendation.

### Default Value

By default, `Notify all admins when other admins reset their password?` is set to "No".