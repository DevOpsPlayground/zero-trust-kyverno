variable "cluster_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_prefixes" {}
variable "default_node_pool_name" {}
variable "default_node_pool_count" {
  default = 1
}
variable "default_node_pool_vm_size" {
  default = "Standard_DS2_v2"
}
variable "tags" {
  type = map(string)
}
