
## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.

#Module      : labels
#Description : Terraform module to create consistent naming for multiple names.
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "0.15.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}


resource "azurerm_subnet" "default" {
  count                                          = var.enabled ? length(var.address_prefixes) : 0
  name                                           = format("%s-%s-%s-%s", var.environment, var.name, element(var.subnet_names, count.index), "subnet")
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefix                                 = element(var.address_prefixes, count.index)
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  service_endpoints                              = var.service_endpoints

  dynamic "delegation" {
    for_each = var.delegations

    content {
      name = delegation.value["name"]

      service_delegation {
        name    = delegation.value["service_delegation_name"]
        actions = delegation.value["service_delegation_actions"]
      }
    }
  }
  timeouts {
    create = var.create
    update = var.update
    read   = var.read
    delete = var.delete
  }
}

resource "azurerm_subnet_network_security_group_association" "default" {
  count                     = var.enabled && var.enabled_nsg ? length(var.address_prefixes) : 0
  subnet_id                 = azurerm_subnet.default[count.index].id
  network_security_group_id = var.network_security_group_id
}