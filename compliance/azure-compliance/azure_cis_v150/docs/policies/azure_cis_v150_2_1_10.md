## Description

Turning on Microsoft Defender for Key Vault enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for Key Vault allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `Key Vault` Select `On` under `Plan`.
6. Select `Save`

### From Azure CLI

Use the below command to enable Standard pricing tier for Storage

```bash
az security pricing create -n 'KeyVaults' --tier 'Standard'
```

### From Powershell

```bash
Set-AzSecurityPricing -Name 'KeyVaults' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender plan is off.