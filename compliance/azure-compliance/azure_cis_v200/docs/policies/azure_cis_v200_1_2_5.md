## Description

For designated users, they will be prompted to use their multi-factor authentication (MFA) process on login.

Enabling multi-factor authentication is a recommended setting to limit the potential of accounts being compromised and limiting access to authenticated personnel.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu in the top left, and select `Azure Active Directory`.
2. Select `Security`
3. Select `Conditional Access`.
4. Click `+ New policy`.
5. Enter a name for the policy.
6. Select `Users or workload identities`.
7. Under `Include`, select `All users`.
8. Under `Exclude`, check `Users and groups`.
9. Select users this policy should not apply to and click `Select`.
10. Select `Cloud apps or actions`.
11. Select `All cloud apps`.
12. Select `Conditions`.
13. Select `Sign-in risk`.
14. Update the `Configure` toggle to `Yes`.
15. Check the sign-in risk level this policy should apply to, e.g. `High` and `Medium`.
16. Select `Done`.
17. Select `Grant`.
18. Under `Grant access`, check `Require multifactor authentication` and click `Select`.
19. Set `Enable policy` to `Report-only`.
20. Click `Create`.

After testing the policy in report-only mode, update the `Enable policy` setting from `Report-only` to `On`.

### Default Value

MFA is not enabled by default.
