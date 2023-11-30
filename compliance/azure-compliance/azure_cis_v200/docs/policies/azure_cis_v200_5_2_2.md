## Description

Create an activity log alert for the Delete Policy Assignment event.

Monitoring for delete policy assignment events gives insight into changes done in "azure policy - assignments" and can reduce the time it takes to detect unsolicited changes.

## Remediation

### From Azure Portal

1. Navigate to the `Monitor` blade.
2. Click on `Alerts`.
3. Click on `Create`.
4. Click on `Alert rule`.
5. Under `Filter by subscription`, choose a subscription.
6. Under `Filter by resource type`, select `Policy assignment (policyAssignments)`.
7. Under `Filter by location`, select `All`.
8. From the results, select the subscription.
9. Select `Done`.
10. Select the `Condition` tab.
11. Under `Signal name`, click `Delete policy assignment (Microsoft.Authorization/policyAssignments)`.
12. Select the `Actions` tab.
13. To use an existing action group, click `Select action groups`. To create a new action group, click `Create action group`. Fill out the appropriate details for the selection.
14. Select the `Details` tab.
15. Select a Resource group, provide an `Alert rule name` and an optional `Alert rule description`.
16. Click `Review + create`.
17. Click `Create`.

### From Azure CLI

```bash
az monitor activity-log alert create --resource-group "<resource group name>" --condition category=Administrative and operationName=Microsoft.Authorization/policyAssignments/delete and level=<verbose | information | warning | error | critical> --scope "/subscriptions/<subscription ID>" --name "<activity log rule name>" -- subscription <subscription id> --action-group <action group ID> --location global
```

### From PowerShell

Create the conditions object

```bash
$conditions = @()
$conditions += New-AzActivityLogAlertAlertRuleAnyOfOrLeafConditionObject - Equal Administrative -Field category
$conditions += New-AzActivityLogAlertAlertRuleAnyOfOrLeafConditionObject - Equal Microsoft.Authorization/policyAssignments/delete -Field operationName $conditions += New-AzActivityLogAlertAlertRuleAnyOfOrLeafConditionObject - Equal Verbose -Field level
```

Retrieve the `Action Group` information and store in a variable, then create the `Action` object.

```bash
$actionGroup = Get-AzActionGroup -ResourceGroupName <resource group name> - Name <action group name>
$actionObject = New-AzActivityLogAlertActionGroupObject -Id $actionGroup.Id
```

Create the `Scope` variable.

```bash
$scope = "/subscriptions/<subscription id>"
```

Create the `Activity Log Alert Rule` for `Microsoft.Authorization/policyAssignments/delete`.

```bash
New-AzActivityLogAlert -Name "<activity log alert rule name>" -
ResourceGroupName "<resource group name>" -Condition $conditions -Scope $scope -Location global -Action $actionObject -Subscription <subscription ID> -Enabled $true
```

### Default Value

By default, no monitoring alerts are created.
