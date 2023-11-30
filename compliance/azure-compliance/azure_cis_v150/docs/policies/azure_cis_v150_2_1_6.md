## Description

Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for Open-source relational databases allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `Open-source relational databases` Select `On` under `Plan`.
6. Select `Save`

### From Azure CLI

Run the following command:

```bash
az security pricing create -n 'OpenSourceRelationalDatabases' --tier 'standard'
```

### From Powershell

Use the below command to enable Standard pricing tier for Open-source relational databases

```bash
set-azsecuritypricing -name "OpenSourceRelationalDatabases" -pricingtier "Standard"
```

### Default Value

By default, Microsoft Defender plan is off.