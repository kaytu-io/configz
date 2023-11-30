## Description

Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest full Python version for web apps is recommended in order to take advantage of security fixes, if any, and/or additional functionalities of the newer version.

Newer versions may contain security enhancements and additional functionality. Using the latest software version is recommended in order to take advantage of enhancements and new capabilities. With each software installation, organizations need to determine if a given update meets their requirements. They must also verify the compatibility and support provided for any additional software against the update revision that is selected. Using the latest full version will keep your stack secure to vulnerabilities and exploits.

## Remediation

### From Azure Portal

1. From Azure Home open the Portal Menu in the top left
2. Go to `App Services`
3. Click on each App
4. Under `Settings` section, click on `Configuration`
5. Click on the General settings pane and ensure that the Major Version and the Minor Version is set to the latest stable version available (Python 3.8, at the time of writing)

**NOTE:** No action is required if Python version is set to Off, as Python is not used by your web app.

### From Azure CLI

To see the list of supported runtimes:

```bash
az webapp list-runtimes | grep python
```

To set latest Python version for an existing app, run the following command:

```bash
az webapp config set --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> --linux-fx-version "PYTHON|3.8
```

### Default Value

The version of Python is whatever was selected upon App creation.