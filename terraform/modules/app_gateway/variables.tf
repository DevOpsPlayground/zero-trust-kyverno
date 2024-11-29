variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku_name" {}
variable "sku_tier" {}
variable "capacity" {}
variable "subnet_id" {}
variable "public_ip_id" {}
variable "frontend_port" {
  default = 80
}
variable "backend_port" {
  default = 80
}
variable "tags" {
  type    = map(string)
  default = {}
}
