# Azure DevOps CI/CD Pipeline for AKS Deployment

## Description
This project implements an automated CI/CD pipeline in Azure DevOps to deploy a containerized e-commerce application to Azure Kubernetes Service (AKS). It uses Azure Container Registry (ACR) for image storage and follows best practices for scalability and resilience.

## High-Level Architecture
![Architecture Diagram](architecture-diagram.png)  <!-- Upload the diagram you provided as architecture-diagram.png -->

- **Code Check-in**: Developer pushes code to Azure DevOps Repo.
- **CI Pipeline**: Builds Docker image, pushes to ACR, publishes manifests as artifacts.
- **CD Pipeline**: Deploys Kubernetes manifests to AKS.

## Prerequisites
- Azure Subscription.
- Azure DevOps organization/project.
- Azure CLI installed.

## Setup Instructions

### 1. Provision Azure Resources
Run the scripts in `scripts/provision-resources.sh` and `scripts/assign-roles.sh`.

### 2. Set Up Azure DevOps
- Create a repo in Azure DevOps and push this code (including Dockerfile and manifests).
- Create Service Connections:
  - Azure Resource Manager: `AzureSubscriptionConnection`.
  - Docker Registry: `ACRConnection` (for ACR).
  - Kubernetes: `AKSConnection` (for AKS).
- Create Pipelines:
  - CI: Import `azure-pipelines-ci.yml`.
  - CD: Import `azure-pipelines-cd.yml` and link to CI artifacts.

### 3. Run Pipelines
- Push code to trigger CI.
- Trigger CD to deploy to AKS.
- Access the app: `kubectl get svc` to get the external IP.

## Files
- `app.js`, `package.json`: Sample Node.js app.
- `Dockerfile`: Builds the container.
- `deployment.yaml`, `service.yaml`: K8s manifests.
- `azure-pipelines-ci.yml`: CI pipeline.
- `azure-pipelines-cd.yml`: CD pipeline.

## Testing
- Build locally: `docker build -t ecommerce-app .`
- Deploy locally (with minikube): `kubectl apply -f deployment.yaml -f service.yaml`
