## Description

Microsoft Defender for Resource Manager scans incoming administrative requests to change your infrastructure from both CLI and the Azure portal.

Scanning resource requests lets you be alerted every time there is suspicious activity in order to prevent a security threat from being introduced.

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `Resource Manager` Select `On` under `Plan`.
6. Select `Save`

### From Azure CLI

Use the below command to enable Standard pricing tier for Defender for Resource Manager

```bash
az security pricing create -n 'Arm' --tier 'Standard'
```

### From Powershell

Use the below command to enable Standard pricing tier for Defender for Resource Manager

```bash
Set-AzSecurityPricing -Name 'Arm' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender for Resource Manager is not enabled.