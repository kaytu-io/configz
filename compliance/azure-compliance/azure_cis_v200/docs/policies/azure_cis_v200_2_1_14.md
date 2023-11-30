## Description

None of the settings offered by ASC Default policy should be set to effect `Disabled`.

A security policy defines the desired configuration of your workloads and helps ensure compliance with company or regulatory security requirements. ASC Default policy is associated with every subscription by default. ASC default policy assignment is a set of security recommendations based on best practices. Enabling recommendations in ASC default policy ensures that Azure security center provides the ability to monitor all of the supported recommendations and optionally allow automated action for a few of the supported recommendations.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Microsoft Defender for Cloud`.
3. Select `Environment Settings`.
4. Click on a subscription.
5. Select `Security Policy` in the left column.
6. Click on `ASC Default` under `Default initiative`.
7. Ensure `Policy Enforcement` is `Enabled`.
8. Click on the `Parameters` tab and uncheck `Only show parameters that need input or review`.
9. For any parameters set to `Disabled` or empty, update to a valid value for the organization.
10. Click `Save`.
