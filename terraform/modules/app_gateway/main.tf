resource "azurerm_application_gateway" "app_gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "appGatewayFrontendPort"
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIpConfig"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "appGatewayBackendPool"
  }

  backend_http_settings {
    name                  = "appGatewayBackendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = var.backend_port
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "appGatewayHttpListener"
    frontend_ip_configuration_name = "appGatewayFrontendIpConfig"
    frontend_port_name             = "appGatewayFrontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "appGatewayRoutingRule"
    rule_type                  = "Basic"
    http_listener_name         = "appGatewayHttpListener"
    backend_address_pool_name  = "appGatewayBackendPool"
    backend_http_settings_name = "appGatewayBackendHttpSettings"
    priority                   = 100
  }

  tags = var.tags
}