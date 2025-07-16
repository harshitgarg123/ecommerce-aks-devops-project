az login

RESOURCE_GROUP="harshit-resource"
LOCATION="eastus"
ACR_NAME="ecommcon1"
AKS_NAME="ecommkube112"

az group create --name $RESOURCE_GROUP --location $LOCATION

az acr create --resource-group $RESOURCE_GROUP --name $ACR_NAME --sku Basic --admin-enabled true

az aks create --resource-group $RESOURCE_GROUP --name $AKS_NAME --node-count 1 --enable-addons monitoring --generate-ssh-keys

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_NAME
