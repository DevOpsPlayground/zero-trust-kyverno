locals {
  clusters = [
    {
      cluster_name              = "dev-aks-1"
      location                  = "WEST US"
      dns_prefix                = "devaks1"
      default_node_pool_name    = "default"
      default_node_pool_count   = 2
      default_node_pool_vm_size = "Standard_DS2_v2"
      tags                      = { environment = "dev", type = "primary" }
      vnet_name                 = "dev-vnet-1"
      subnet_name               = "dev-subnet-1"
      resource_group_name       = "dev-rg-1"
      address_space             = "10.0.0.0/16"
      subnet_prefixes           = "10.0.1.0/24"
      app_gateway = {
        name          = "dev-appgw-1"
        sku_name      = "Standard_v2"
        sku_tier      = "Standard_v2"
        capacity      = 2
        frontend_port = 80
        backend_port  = 80
        tags          = { environment = "dev", gateway = "primary" }
      }
    },
    # {
    #   cluster_name              = "dev-aks-2"
    #   location                  = "WEST EUROPE"
    #   dns_prefix                = "devaks2"
    #   default_node_pool_name    = "default"
    #   default_node_pool_count   = 3
    #   default_node_pool_vm_size = "Standard_DS2_v2"
    #   tags                      = { environment = "dev", type = "secondary" }
    #   vnet_name                 = "dev-vnet-2"
    #   subnet_name               = "dev-subnet-2"
    #   resource_group_name       = "dev-rg-2"
    #   address_space             = "10.0.0.0/16"
    #   subnet_prefixes           = "10.0.2.0/24"
    #   app_gateway = {
    #     name          = "dev-appgw-2"
    #     sku_name      = "Standard_v2"
    #     sku_tier      = "Standard_v2"
    #     capacity      = 3
    #     frontend_port = 80
    #     backend_port  = 80
    #     tags          = { environment = "dev", gateway = "secondary" }
    #   }
    # }
  ]
}

