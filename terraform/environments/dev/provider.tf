provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  # Use variables in real code. - d25531d7-a6b4-40d4-8e91-d16c7b1dfc47
}