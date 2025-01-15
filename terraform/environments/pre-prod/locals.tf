locals {
  clusters = [
    for i in range(var.cluster_count) : {
      cluster_name              = "${var.base_config.dns_prefix_base}-${i + 1}"
      location                  = var.base_config.location
      dns_prefix                = "${var.base_config.dns_prefix_base}-${i + 1}"
      default_node_pool_name    = var.base_config.default_node_pool_name
      default_node_pool_count   = var.base_config.default_node_pool_count
      default_node_pool_vm_size = var.base_config.default_node_pool_vm_size
      tags                      = var.base_config.tags
      vnet_name                 = "${var.base_config.vnet_name_base}-${i + 1}"
      subnet_name               = "${var.base_config.subnet_name_base}-${i + 1}"
      resource_group_name       = "${var.base_config.resource_group_name_base}-${i + 1}"
      address_space             = "${var.base_config.address_space_base}"
      subnet_prefixes           = cidrsubnet(var.base_config.subnet_prefixes_base, 8, i)
      app_gateway = {
        name          = "${var.base_config.app_gateway.name_base}-${i + 1}"
        sku_name      = var.base_config.app_gateway.sku_name
        sku_tier      = var.base_config.app_gateway.sku_tier
        capacity      = var.base_config.app_gateway.capacity
        frontend_port = var.base_config.app_gateway.frontend_port
        backend_port  = var.base_config.app_gateway.backend_port
        tags          = var.base_config.app_gateway.tags
      }
    }
  ]
}