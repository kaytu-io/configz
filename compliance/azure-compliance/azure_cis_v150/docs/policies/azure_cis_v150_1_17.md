## Description

Restrict access to the Azure AD administration portal to administrators only.

**NOTE:** This only affects access to the Azure AD administrator's web portal. This setting does not prohibit privileged users from using other methods such as Rest API or Powershell to obtain sensitive information from Azure AD.

The Azure AD administrative portal has sensitive data and permission settings. All non-administrators should be prohibited from accessing any Azure AD data in the administration portal to avoid exposure.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users`
4. Select `User settings`
5. Set `Restrict access to Azure AD administration portal` to `Yes`

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

### Default Value

By default, `Restrict access to Azure AD administration portal` is set to `No`.