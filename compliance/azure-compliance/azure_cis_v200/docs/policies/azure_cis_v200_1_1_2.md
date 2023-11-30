## Description

Enable multi-factor authentication for all roles, groups, and users that have write access or permissions to Azure resources. These include custom created objects or built-in roles such as;
- Service Co-Administrators
- Subscription Owners
- Contributors

Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory` blade.
3. Select `Users`.
4. Take note of all users with the role `Service Co-Administrators`, `Owners` or `Contributors`.
5. Click on the `Per-User MFA button` in the top row menu.
6. Check the box next to each noted user.
7. Click `Enable` under quick steps in the right-hand panel.
8. Click `enable multi-factor auth`.
9. Click `close`.

### Other Options within Azure Portal

Follow Microsoft Azure documentation and enable multi-factor authentication in your environment.

https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-azure-mfa

Enabling and configuring MFA with conditional access policy is a multi-step process. Here are some additional resources on the process within Azure AD to enable multi- factor authentication for users within your subscriptions with conditional access policy.

https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-admin-mfa https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted#enable-multi-factor-authentication-with-conditional-access https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings

### Default Value

By default, multi-factor authentication is disabled for all users.
