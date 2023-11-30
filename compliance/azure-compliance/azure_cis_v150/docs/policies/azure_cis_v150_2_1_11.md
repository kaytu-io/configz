## Description

Microsoft Defender for DNS scans all network traffic exiting from within a subscription.

DNS lookups within a subscription are scanned and compared to a dynamic list of websites that might be potential security threats. These threats could be a result of a security breach within your services, thus scanning for them could prevent a potential security threat from being introduced.

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `DNS` Select `On` under `Plan`.
6. Select `Save`

### From Azure CLI

Use the below command to enable Standard pricing tier for App Service

```bash
az security pricing create -n 'DNS' --tier 'Standard'
```

### From Powershell

```bash
Set-AzSecurityPricing -Name 'DNS' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender for DNS is not enabled.