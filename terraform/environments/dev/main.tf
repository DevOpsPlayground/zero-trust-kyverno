# module "aks_clusters" {
#   source                = "../../modules/aks"
#   for_each              = toset(local.clusters)

#   cluster_name          = each.value.cluster_name
#   location              = each.value.location
#   resource_group_name   = each.value.resource_group_name
#   dns_prefix            = each.value.dns_prefix
#   default_node_pool_name = each.value.default_node_pool_name
#   default_node_pool_count = each.value.default_node_pool_count
#   default_node_pool_vm_size = each.value.default_node_pool_vm_size
#   tags                  = each.value.tags
#   depends_on = [ module.vnet,local.clusters ]
# }


module "aks_clusters" {
  source                    = "../../modules/aks"
  for_each                  = { for x in local.clusters : x.cluster_name => x }
  cluster_name              = each.value.cluster_name
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  dns_prefixes              = each.value.dns_prefix
  default_node_pool_name    = each.value.default_node_pool_name
  default_node_pool_count   = each.value.default_node_pool_count
  default_node_pool_vm_size = each.value.default_node_pool_vm_size
  tags                      = each.value.tags
  depends_on                = [module.vnet]
}

module "vnet" {
  source   = "../../modules/vnet"
  for_each = { for x in local.clusters : x.cluster_name => x }

  vnet_name           = each.value.vnet_name
  subnet_name         = each.value.subnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_prefixes     = each.value.subnet_prefixes
}
module "appgw_ip" {
  source              = "../../modules/public_ip"
  for_each            = { for x in local.clusters : x.cluster_name => x }
  ip_name             = "appgw-ip-${each.value.cluster_name}"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  depends_on          = [module.vnet]
}

# Use the Application Gateway module for multiple gateways
module "app_gateways" {
  source   = "../../modules/app_gateway"
  for_each = { for x in local.clusters : x.cluster_name => x }

  name                = each.value.app_gateway.name
  location            = each.value.location
  resource_group_name = module.vnet[each.key].resource_group_names
  sku_name            = each.value.app_gateway.sku_name
  sku_tier            = each.value.app_gateway.sku_tier
  capacity            = each.value.app_gateway.capacity
  subnet_id           = module.vnet[each.key].subnet_id
  public_ip_id        = module.appgw_ip[each.key].public_ip_id
  frontend_port       = each.value.app_gateway.frontend_port
  backend_port        = each.value.app_gateway.backend_port
  tags                = each.value.app_gateway.tags
  depends_on          = [module.appgw_ip, module.vnet]
}