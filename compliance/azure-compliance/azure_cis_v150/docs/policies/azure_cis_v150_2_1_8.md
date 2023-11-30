## Description

Turning on Microsoft Defender for Containers enables threat detection for Container Registries including Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for Container Registries allows for greater defense-indepth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` under the 'Settings' heading.
5. For `Containers` click the sliding button under the `Status` heading to be `On`
6. Click `Save` in the top left.

### From Azure CLI

Use the below command to enable Standard pricing tier for Storage

```bash
az security pricing create -n 'ContainerRegistry' --tier 'standard'
```

### From Powershell

```bash
Set-AzSecurityPricing -Name 'ContainerRegistry' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender plan is off.