## Description

Enable Diagnostic settings for exporting activity logs. Diagnostic setting are available for each individual resources within a subscription. Settings should be configured for all appropriate resources for your environment.

A diagnostic setting controls how a diagnostic log is exported. By default, logs are retained only for 90 days. Diagnostic settings should be defined so that logs can be exported and stored for a longer duration in order to analyze security activities within an Azure subscription.

## Remediation

### From Azure Portal

1. Go to `Monitor`
2. Click `Diagnostic settings`
3. Click on the resource that has a diagnostics status of `disabled`
4. Select `Add Diagnostic Setting`
5. Enter a `Diagnostic setting name`
6. Select the appropriate log, metric, and destination. (This may be Log Analytics/Storage account or Event Hub)
7. Click `save`

Repeat these step for all resources as needed.

### Default Value

By default, diagnostic setting is not set.
