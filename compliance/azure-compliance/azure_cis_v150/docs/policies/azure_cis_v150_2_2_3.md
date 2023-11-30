## Description

Enable automatic provisioning of the Microsoft Defender for Containers components.

As with any compute resource, Container environments require hardening and run-time protection to ensure safe operations and detection of threats and vulnerabilities.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Microsoft Defender for Cloud`
3. Select `Environment Settings`
4. Select a subscription
5. Select `Auto Provisioning` in the left column.
6. Set `Microsoft Defender for Containers components` to `On`

Repeat the above for any additional subscriptions.

### Default Value

By default, Microsoft Defender for Containers is disabled. If Defender for Containers is enabled from the Microsoft Defender for Cloud portal, auto provisioning will be enabled.