## Description

Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for SQL servers on machines allows for greater defensein-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `SQL Servers on machines` Select `On` under `Plan`.
6. Select `Save`

### From Azure CLI

Run the following command:

```bash
az security pricing create -n SqlServerVirtualMachines --tier 'standard'
```

### From Powershell

Run the following command:

```bash
Set-AzSecurityPricing -Name 'SqlServerVirtualMachines' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender plan is off.