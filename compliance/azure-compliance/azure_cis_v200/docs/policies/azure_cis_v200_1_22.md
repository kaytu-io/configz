## Description

Joining or registering devices to the active directory should require Multi-factor authentication.

Multi-factor authentication is recommended when adding devices to Azure AD. When set to Yes, users who are adding devices from the internet must first use the second method of authentication before their device is successfully added to the directory. This ensures that rogue devices are not added to the domain using a compromised user account. Note: Some Microsoft documentation suggests to use conditional access policies for joining a domain from certain whitelisted networks or devices. Even with these in place, using Multi-Factor Authentication is still recommended, as it creates a process for review before joining the domain.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Devices`.
4. Select `Device settings`.
5. Set `Require Multi-Factor Authentication to register or join devices with Azure AD` to `Yes`.

### Default Value

By default, `Require Multi-Factor Authentication to register or join devices with Azure AD` is set to `No`.
