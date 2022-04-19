provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "git::https://github.com/clouddrove-sandbox/terraform-azure-resource-group.git?ref=CD-433"
  environment = "test"
  label_order = ["name", "environment"]

  name     = "example-resource-group"
  location = "North Europe"
}

module "vnet" {
  source = "git::https://github.com/clouddrove-sandbox/terraform-azure-virtual-network.git?ref=CD-433"

  environment = "test"
  label_order = ["name", "environment"]

  name                = "example"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/10"
}

module "security_group" {
  source = "git::https://github.com/clouddrove-sandbox/terraform-azure-security-group.git?ref=CD-433"

  ## Tags
  name        = "example-sg"
  environment = "test"
  label_order = ["name", "environment"]

  ## Security Group
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  ##Security Group rule for http
  http_inbound_allowed            = true
  allowed_http_source             = ["0.0.0.0/0"]
  http_destination_address_prefix = "VirtualNetwork"


  ##Security Group rule for https
  https_inbound_allowed            = true
  allowed_https_source             = ["0.0.0.0/0"]
  https_destination_address_prefix = "VirtualNetwork"


  ##Security Group rule for Custom port.
  custom_port = [{
    name                         = "custom"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_ranges      = ["22"]
    source_address_prefixes      = ["0.0.0.0/0"]
    destination_address_prefixes = ["0.0.0.0/0"]
    access                       = "Allow"
    priority                     = 1006
  }]
}

module "subnet" {
  source = "../"

  name        = "example"
  environment = "test"
  label_order = ["name", "environment"]

  subnet_names         = ["public", "private"]
  address_prefixes     = ["10.0.0.0/24", "10.0.1.0/24"]
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = join("", module.vnet.vnet_name)
  service_endpoints    = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Sql"]
  delegations = [
    {
      name                       = "Test-1"
      service_delegation_name    = "Microsoft.ContainerInstance/containerGroups"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  ]
  enabled_nsg               = true
  network_security_group_id = module.security_group.security_group_id
}