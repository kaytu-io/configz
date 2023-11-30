## Description

Require administrators to provide consent for the apps before use.

Unless Azure Active Directory is running as an identity provider for third-party applications, do not allow users to use their identity outside of your cloud environment. User profiles contain private information such as phone numbers and email addresses which could then be sold off to other third parties without requiring any further consent from the user.

## Remediation

### From Azure Portal

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users`
4. Select `User settings`
5. Then `Manage how end users launch and view their applications`
6. Set `Users can add gallery apps to My Apps` to `No`

### Default Value

By default, `Users can add gallery apps to My Apps` is set to `No`.