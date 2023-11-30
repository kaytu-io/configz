## Description

Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the newer version.

Newer versions may contain security enhancements and additional functionality. Using the latest software version is recommended in order to take advantage of enhancements and new capabilities. With each software installation, organizations need to determine if a given update meets their requirements. They must also verify the compatibility and support provided for any additional software against the update revision that is selected.

## Remediation

### From Azure Portal

1. Login to Azure Portal using https://portal.azure.com
2. Go to `App Services`
3. Click on each App
4. Under `Settings` section, click on `Configuration`
5. Click on the `General settings` pane and ensure that for a `Stack` of `Java` the `Major Version` and `Minor Version` reflect the latest stable and supported release, and that the `Java web server version` is set to the `auto-update` option.

**Note** No action is required if Java version is set to Off, as Java is not used by your web app.

### From Azure CLI

To see the list of supported runtimes:

```bash
az webapp list-runtimes | grep java
```

To set latest Java version for an existing app, run the following command:

```bash
az webapp config set --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> --java-version <JAVA_VERSION> --java-container <JAVA_CONTAINER> --java- container-version <JAVA_CONTAINER_VERSION>
```

### Default Value

The default setting is whichever setting was chosen in the creation of the webapp.
