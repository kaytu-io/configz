## Description

Enable automatic provisioning of the monitoring agent to collect security data.

When `Log Analytics agent for Azure VMs` is turned on, Microsoft Defender for Cloud provisions the Microsoft Monitoring Agent on all existing supported Azure virtual machines and any new ones that are created. The Microsoft Monitoring Agent scans for various security-related configurations and events such as system updates, OS vulnerabilities, endpoint protection, and provides alerts.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Microsoft Defender for Cloud`.
3. Select `Environment Settings`.
4. Select a subscription.
5. Click on `Settings & Monitoring`.
6. Ensure that `Log Analytics agent for Azure VMs` is set to `On`.

### From Azure CLI

Use the below command to set `Automatic provisioning of monitoring agent` to `On`.

```bash
az account get-access-token --query
"{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json"
https://management.azure.com/subscriptions/subscriptionID/providers/Microsoft .Security/autoProvisioningSettings/default?api-version=2017-08-01-preview - d@"input.json"'
```

Where `input.json` contains the Request body json data as mentioned below.

```bash
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/autoProvi sioningSettings/default",
  "name": "default",
  "type": "Microsoft.Security/autoProvisioningSettings",
  "properties": {
    "autoProvision": "On"
  }
}
```

### Default Value

By default, `Automatic provisioning of monitoring agent` is set to `On`.
