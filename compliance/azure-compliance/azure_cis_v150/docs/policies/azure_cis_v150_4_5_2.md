## Description

Private endpoints limit network traffic to approved sources.

For sensitive data, private endpoints allow granular control of which services can communicate with Cosmos DB and ensure that this network traffic is private. You set this up on a case by case basis for each service you wish to be connected.

## Remediation

### From Azure Portal

1. Open the portal menu.
2. Select the Azure Cosmos DB blade
3. Select the subscription you wish to audit.
4. Select the Database you wish to add an endpoint to.
5. Then in the portal menu column select the blade 'Private Endpoint Connections'.
6. Click '+ Private Endpoint'
7. Select which subscription and resource group you want the endpoint to be in. Name it as desired.
8. Select which subscription the endpoint will be under, its resource type.
9. Select which virtual network desired.
10. Select the DNS servers the endpoint will contact.
11. Tag as desired and create.
12. Back in the Private Endpoints view, select the endpoint and associate it with the Cosmos DB.
13. In the listing below confirm that the listed selected networks are set to the appropriate endpoints.

### Default Value

By default Cosmos DB does not have private endpoints enabled and its traffic is public to the network.