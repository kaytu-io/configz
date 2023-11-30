## Description

Configure 'Send scan reports to' with email addresses of concerned data owners/stakeholders for a critical SQL servers.

Vulnerability Assessment (VA) scan reports and alerts will be sent to email addresses configured at 'Send scan reports to'. This may help in reducing time required for identifying risks and taking corrective measures.

## Remediation

### From Azure Console

1. Go to `SQL servers`.
2. Select a server instance.
3. Select `Microsoft Defender for Cloud`.
4. Select `Configure` next to `Enablement status`.
5. Set `Microsoft Defender for SQL` to `On`.
6. Under `Vulnerability Assessment Settings`, select a Storage Account.
7. Set `Periodic recurring scans` to `On`.
8. Under `Send scan reports to`, provide email addresses for data owners and stakeholders.
9. Click `Save`.

### From Powershell

If not already, Enable `Advanced Data Security` for a SQL Server:

```bash
Set-AZSqlServerThreatDetectionPolicy -ResourceGroupName <resource group name> -ServerName <server name> -EmailAdmins $True
```

To enable ADS-VA service and Set 'Send scan reports to'

```bash
Update-AzSqlServerVulnerabilityAssessmentSetting
  `-ResourceGroupName "<resource group name>"`
  -ServerName "<Server Name>"`
  -StorageAccountName "<Storage Name from same subscription and same Location" `
  -ScanResultsContainerName "vulnerability-assessment" `
  -RecurringScansInterval Weekly `
  -EmailSubscriptionAdmins $true `
  -NotificationEmail @("mail1@mail.com" , "mail2@mail.com")
```

### Default Value

By default, 'Send reports to' is blank.