# ACR ID
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $RESOURCE_GROUP --query "id" --output tsv)

# AKS Service Principal (or Managed Identity) ID
AKS_SP_ID=$(az aks show --resource-group $RESOURCE_GROUP --name $AKS_NAME --query "identity.principalId" --output tsv)

# Assign AcrPull role to AKS
az role assignment create --assignee $AKS_SP_ID --role "AcrPull" --scope $ACR_ID
