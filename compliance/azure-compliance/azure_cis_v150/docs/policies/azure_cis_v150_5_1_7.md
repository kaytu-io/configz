## Description

Enable AppServiceHTTPLogs diagnostic log category for Azure App Service instances to ensure all http requests are captured and centrally logged.

Capturing web requests can be important supporting information for security analysts performing monitoring and incident response activities. Once logging, these logs can be ingested into SIEM or other central aggregation point for the organization.

## Remediation

### From Azure Portal

1. Go to `App Services`
2. For each App Service:
3. Go to `Diagnostic Settings`
4. Click `Add Diagnostic Setting`
5. Check the checkbox next to 'AppServiceHTTPLogs'
6. Configure destination based on your specific logging consumption capability (for example Stream to an event hub and then consuming with SIEM integration for Event Hub logging).
