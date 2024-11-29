#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if Helm is installed
check_helm_installed() {
  if ! command -v helm &> /dev/null; then
    echo "Helm not found. Please install Helm and try again."
    exit 1
  fi
}

# Step 1: Verify Helm is installed
echo "Checking if Helm is installed..."
check_helm_installed
echo "Helm is installed."

# Step 2: Add and install Kyverno
echo "Adding Kyverno Helm repository..."
helm repo add kyverno https://kyverno.github.io/kyverno/
echo "Updating Helm repositories..."
helm repo update
echo "Installing Kyverno..."
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
echo "Kyverno installation completed."

# Step 3: Add and install Prometheus and Grafana
echo "Adding Prometheus Community Helm repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
echo "Updating Helm repositories..."
helm repo update
echo "Installing Prometheus and Grafana..."
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
echo "Prometheus and Grafana installation completed."

# Step 4: Verify Prometheus pods
echo "Fetching Prometheus and Grafana pods..."
kubectl -n monitoring get po -l "release"

echo "Installation script completed successfully."