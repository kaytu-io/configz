## Description

Restrict invitations to users with specific administrative roles only

Restricting invitations to users with specific administrator roles ensures that only authorized accounts have access to cloud resources. This helps to maintain "Need to Know" permissions and prevents inadvertent access to data.

By default the setting Guest invite restrictions is set to Anyone in the organization can invite guest users including guests and non-admins. This would allow anyone within the organization to invite guests and non-admins to the tenant, posing a security risk.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `External Identities`
4. Select `External collaboration settings`
5. Under `Guest invite settings`, for `Guest invite restrictions`, ensure that that `Only users assigned to specific admin roles can invite guest users` is selected

### Default Value

By default, `Guest invite restrictions` is set to `Anyone in the organization can invite guest users including guests and non-admins`.