## Description

Users who are set as subscription owners are able to make administrative changes to the subscriptions and move them into and out of Azure Active Directories.

Permissions to move subscriptions in and out of Azure Active Directory must only be given to appropriate administrative personnel. A subscription that is moved into an Azure Active Directory may be within a folder to which other users have elevated permissions. This prevents loss of data or unapproved changes of the objects within by potential bad actors.

## Remediation

### From Azure Portal

1. From the Azure Portal Home select the portal menu in the top left.
2. In the column that opens up select General and then Subscriptions within the page that opens up.
3. Select Manage policies
4. In the screen that next to Subscription leaving AAD directory and Subscription entering AAD select Permit no-one

### Default Value

By default `Subscription leaving AAD directory` and `Subscription entering AAD` are set to `Allow everyone (default)`.