<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.app_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_port"></a> [backend\_port](#input\_backend\_port) | n/a | `number` | `80` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | n/a | `any` | n/a | yes |
| <a name="input_frontend_port"></a> [frontend\_port](#input\_frontend\_port) | n/a | `number` | `80` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | n/a | `any` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_gateway_id"></a> [app\_gateway\_id](#output\_app\_gateway\_id) | n/a |
| <a name="output_app_gateway_name"></a> [app\_gateway\_name](#output\_app\_gateway\_name) | n/a |
<!-- END_TF_DOCS -->