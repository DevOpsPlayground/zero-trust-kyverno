## Requirements
# **Azure Kubernetes Service (AKS) Deployment with Terraform**

This project provisions and manages **Azure Kubernetes Service (AKS)** clusters using Terraform. The code is modular, allowing for dynamic creation of multiple AKS clusters and associated resources like virtual networks and subnets.

---

## **Project Structure**

terraform/ ├── modules/ │ ├── aks/ # AKS module │ ├── vnet/ # Virtual Network module ├── environments/ │ ├── dev/ # Development environment │ ├── prod/ # Production environment ├── provider.tf # Azure provider configuration ├── versions.tf # Terraform version and providers

## How It Works
Check Azure Login:

It first verifies if the user is logged into Azure using az account show.
If not logged in, it runs az login and waits for the user to complete the login process.
- Install kubectl:

Checks if kubectl is installed and installs it if missing.
- Download kubeconfig:

Fetches the kubeconfig file for the specified AKS cluster.
- Test Configuration:

Runs kubectl get nodes to verify the connection to the Kubernetes cluster.

### **Modules**
1. **AKS Module (`modules/aks/`)**  
   Provisions Azure Kubernetes clusters.
2. **VNet Module (`modules/vnet/`)**  
   Provisions Azure Virtual Networks and Subnets.
3. **aApp gateway (`modules/app_gateway/`)**  
   Provisions Azure application gateway for each cluster.
4. **Public IP Module (`modules/public_ip/`)**  
   Provisions Azure Virtual public IP for each cluster

### **Environments**
Each environment (e.g., `dev`, `prod`) includes its specific configurations and uses the modules for deployment.

---

## **Prerequisites**
1. **Terraform**: Install Terraform (version `1.3.0` or later).
2. **Azure CLI**: Install and authenticate using `az login`.
3. **Azure Subscription**: Ensure you have access to an Azure subscription.

---
## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks_clusters"></a> [aks\_clusters](#module\_aks\_clusters) | ../../modules/aks | n/a |
| <a name="module_app_gateways"></a> [app\_gateways](#module\_app\_gateways) | ../../modules/app_gateway | n/a |
| <a name="module_appgw_ip"></a> [appgw\_ip](#module\_appgw\_ip) | ../../modules/public_ip | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../modules/vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `any` | n/a | yes |

## Outputs

No outputs.


# Deployment

## **Prerequisites**
1. **Terraform**: Install Terraform (version `1.3.0` or later).
2. **Azure CLI**: Install and authenticate using `az login`.
3. **Azure Subscription**: Ensure you have access to an Azure subscription.

---

## **Getting Started**

### 1. **Clone the Repository**

git clone <repository-url>
cd terraform

Choose the environment to deploy, e.g., dev:

cd environments/dev

### clone the repository
### Change directory to terraform/environments/dev

To add or remove clusters
- go to locals.tf
- Update cluster configuration
- Add or remove entries to create or delete cluster

### Create a new terraform.tfvars file with the following details
```
subscription_id = "xxxxxxx-xxxx-xxxx-xxxxxxxxxxxxxxxx"
tenant_id       = "xxxxxxx-xxxx-xxxx-xxxxxxxxxxxxxxxx"
client_id       = "xxxxxxx-xxxx-xxxx-xxxxxxxxxxxxxxxx"
client_secret   = "xxxxxxx-xxxx-xxxx-xxxxxxxxxxxxxxxx"
```

### Next run terraform init to initialize terraform environment
```
terraform init
terraform plan
terraform apply
```

### To configure your service principal, run the following command
A Service Principal is a non-interactive way to log in, commonly used for automation.


Steps
Create a Service Principal: Run the following command to create a Service Principal with the necessary role for your AKS cluster:

```
az ad sp create-for-rbac --name "myServicePrincipal" --role Contributor --scopes /subscriptions/<your-subscription-id>
Replace <your-subscription-id> with your Azure subscription ID. The output will look like this:
```
### To configure KUBECONFIG and gain access to your cluster
Next change directory to the root (terraform folder)
In the get-kube-config.sh script, you'll need to define the following variables
```
SP_APP_ID="xxxxxx-xxx-xxxx-xxxx-xxxxx"       # Service Principal app ID
SP_PASSWORD="xxxxxx-xxx-xxxx-xxxx-xxxxx"   # Service Principal password
SP_TENANT="xxxxxx-xxx-xxxx-xxxx-xxxxx"   # Tenant ID
RESOURCE_GROUP="dev-rg-1"  # AKS Resource Group
CLUSTER_NAME="dev-aks-1"      # AKS Cluster Name
KUBECONFIG_FILE="$HOME/.kube/config"   # Output path for kubeconfig
```

Ensure you are in the root directory  and run the following to download kubeconfig file for your cluster and gain access
```
run chmod +x get-kube-config.sh
./get-kube-config.sh
```

## Notes
Azure Sizing Options:
https://azure.microsoft.com/en-us/pricing/vm-selector/
https://azure.microsoft.com/en-us/pricing/calculator/?service=kubernetes-service