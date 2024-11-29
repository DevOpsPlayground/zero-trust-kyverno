
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefixes
  sku_tier            = "Standard"
  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_count
    vm_size    = var.default_node_pool_vm_size
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    environment = "test"
  }
}
