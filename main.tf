
## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.


module "labels" {

  source  = "clouddrove/labels/azure"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

#Subnet
resource "azurerm_subnet" "subnet" {
  count                                         = var.enable && var.default_name_subnet == true ? length(var.subnet_names) : 0
  name                                          = "${var.name}-${var.subnet_names[count.index]}"
  resource_group_name                           = var.resource_group_name
  address_prefixes                              = [var.subnet_prefixes[count.index]]
  virtual_network_name                          = var.virtual_network_name
  private_endpoint_network_policies_enabled     = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  service_endpoints                             = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], [])
  private_link_service_network_policies_enabled = var.subnet_enforce_private_link_service_network_policies

  dynamic "delegation" {
    for_each = var.private_delegation
    content {
      name = lookup(each.value.private_delegation, "name", null)
      service_delegation {
        name    = lookup(each.value.private_delegation.service_delegation, "name", null)
        actions = lookup(each.value.private_delegation.service_delegation, "actions", null)
      }
    }
  }
}

resource "azurerm_subnet" "subnet2" {
  count                                         = var.enable && var.specific_name_subnet == true ? 1 : 0
  name                                          = var.specific_subnet_names
  resource_group_name                           = var.resource_group_name
  address_prefixes                              = [var.subnet_prefixes[count.index]]
  virtual_network_name                          = var.virtual_network_name
  private_endpoint_network_policies_enabled     = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.specific_subnet_names, false)
  service_endpoints                             = lookup(var.subnet_service_endpoints, var.specific_subnet_names, [])
  private_link_service_network_policies_enabled = var.subnet_enforce_private_link_service_network_policies

  dynamic "delegation" {
    for_each = var.private_delegation
    content {
      name = lookup(each.value.private_delegation, "name", null)
      service_delegation {
        name    = lookup(each.value.private_delegation.service_delegation, "name", null)
        actions = lookup(each.value.private_delegation.service_delegation, "actions", null)
      }
    }
  }
}

#Nat Gateway
resource "azurerm_public_ip" "pip" {
  count               = var.create_nat_gateway ? 1 : 0
  allocation_method   = "Static"
  location            = var.location
  name                = format("%s-nat-gateway-ip", module.labels.id)
  resource_group_name = var.resource_group_name
  zones               = var.public_ip_zones
  sku                 = "Standard"

  tags = module.labels.tags
}

resource "azurerm_nat_gateway" "natgw" {
  count                   = var.create_nat_gateway ? 1 : 0
  location                = var.location
  name                    = format("%s-nat-gateway", module.labels.id)
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = var.nat_gateway_idle_timeout

  tags = module.labels.tags
}

resource "azurerm_nat_gateway_public_ip_association" "pip_assoc" {
  count                = var.create_nat_gateway ? 1 : 0
  nat_gateway_id       = join("", azurerm_nat_gateway.natgw.*.id)
  public_ip_address_id = azurerm_public_ip.pip[0].id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
  count          = var.create_nat_gateway ? (var.default_name_subnet == true ? length(azurerm_subnet.subnet.*.id) : length(azurerm_subnet.subnet2.*.id)) : 0
  nat_gateway_id = join("", azurerm_nat_gateway.natgw.*.id)
  subnet_id      = var.default_name_subnet == true ? azurerm_subnet.subnet.*.id[count.index] : azurerm_subnet.subnet2.*.id[count.index]
}

#Route Table
resource "azurerm_route_table" "rt" {
  count               = var.enable && var.enable_route_table ? 1 : 0
  name                = format("%s-route-table", module.labels.id)
  location            = var.location
  resource_group_name = var.resource_group_name
  dynamic "route" {
    for_each = var.routes
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = lookup(route.value, "next_hop_in_ip_address", null)
    }
  }
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = module.labels.tags
}

resource "azurerm_subnet_route_table_association" "main" {
  count          = var.enable && var.enable_route_table && var.default_name_subnet ? length(var.subnet_prefixes) : 0
  subnet_id      = element(azurerm_subnet.subnet.*.id, count.index)
  route_table_id = join("", azurerm_route_table.rt.*.id)
}

resource "azurerm_subnet_route_table_association" "main2" {
  count          = var.enable && var.enable_route_table && var.specific_name_subnet ? length(var.subnet_prefixes) : 0
  subnet_id      = element(azurerm_subnet.subnet2.*.id, count.index)
  route_table_id = join("", azurerm_route_table.rt.*.id)
}
