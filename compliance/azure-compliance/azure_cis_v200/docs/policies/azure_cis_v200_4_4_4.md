## Description

Set `audit_log_enabled` to include CONNECTION on MySQL Servers.

Enabling CONNECTION helps MySQL Database to log items such as successful and failed connection attempts to the server. Log data can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Database for MySQL servers`.
3. Select a database.
4. Under Settings, select `Server parameters`.
5. Update `audit_log_enabled` parameter to `ON`.
6. Update `audit_log_events` parameter to have at least `CONNECTION` checked.
7. Click `Save`.
8. Under `Monitoring`, select `Diagnostic settings`.
9. Select `+ Add diagnostic setting`.
10. Provide a diagnostic setting name.
11. Under `Categories`, select `MySQL Audit Logs`.
12. Specify destination details.
13. Click `Save`.

It may take up to 10 minutes for the logs to appear in the configured destination.

### Default Value

By default `audit_log_events` is disabled.
