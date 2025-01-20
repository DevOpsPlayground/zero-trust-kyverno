#!/bin/bash

SP_APP_ID="xxxxxxxxxx"       # Service Principal app ID
SP_PASSWORD="xxxxxxxxxxxx"   # Service Principal password
SP_TENANT="xxxxxxxxxxx"    # Tenant ID
RESOURCE_GROUP="rg-1"  # AKS Resource Group
CLUSTER_NAME="cluster-1"      # AKS Cluster Name
SUBSCRIPTION_ID="xxxxxxxxxxxxxxxx"  # Subscription ID
KUBECONFIG_FILE="$HOME/.kube/config"   # Output path for kubeconfig
# Function to log into Azure using a Service Principal
service_principal_login() {
    echo "Logging into Azure using Service Principal..."
    az account set -s "$SUBSCRIPTION_ID"
    az login --service-principal --username "$SP_APP_ID" --password "$SP_PASSWORD" --tenant "$SP_TENANT"
    if [ $? -ne 0 ]; then
        echo "Azure login failed. Please check your Service Principal credentials."
        exit 1
    fi
    echo "Azure login successful."
}

# Function to download kubeconfig
download_kubeconfig() {
    echo "Downloading kubeconfig for cluster $CLUSTER_NAME..."
    az aks get-credentials --resource-group "$RESOURCE_GROUP" --name "$CLUSTER_NAME" --file "$KUBECONFIG_FILE" --overwrite-existing
    if [ $? -ne 0 ]; then
        echo "Failed to download kubeconfig. Please check your cluster details."
        exit 1
    fi
    echo "Kubeconfig saved to $KUBECONFIG_FILE."
}

# Function to test kubectl connection
test_kubectl() {
    echo "Testing kubectl connection..."
    kubectl get nodes
    # kubectl get nodes --kubeconfig <(echo $KUBECONFIG_FILE | base64 --decode)
    if [ $? -ne 0 ]; then
        echo "kubectl configuration failed. Check kubeconfig."
        exit 1
    fi
    echo "kubectl is configured correctly."
}

# Main script execution
service_principal_login
download_kubeconfig
test_kubectl

echo "AKS kubeconfig setup completed successfully."

# az aks get-credentials --resource-group dev-rg-1 --name dev-aks-1 --overwrite-existing
