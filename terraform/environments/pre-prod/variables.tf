variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}


variable "cluster_count" {
  type        = number
  description = "Number of AKS clusters to create"
  default     = 0
}

variable "base_config" {
  type = object({
    location                  = string
    dns_prefix_base           = string
    default_node_pool_name    = string
    default_node_pool_count   = number
    default_node_pool_vm_size = string
    vnet_name_base            = string
    subnet_name_base          = string
    resource_group_name_base  = string
    address_space_base        = string
    subnet_prefixes_base      = string
    tags                      = map(string)
    app_gateway = object({
      name_base     = string
      sku_name      = string
      sku_tier      = string
      capacity      = number
      frontend_port = number
      backend_port  = number
      tags          = map(string)
    })
  })
}