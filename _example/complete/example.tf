provider "azurerm" {
  features {}
}

locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
}

module "resource_group" {
  source      = "clouddrove/resource-group/azure"
  version     = "1.0.2"
  name        = local.name
  environment = local.environment
  label_order = local.label_order
  location    = "North Europe"
}

module "vnet" {
  source              = "clouddrove/vnet/azure"
  version             = "1.0.4"
  name                = local.name
  environment         = local.environment
  label_order         = local.label_order
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

module "subnet" {
  source               = "../.."
  enable               = false
  name                 = local.name
  environment          = local.environment
  label_order          = local.label_order
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.vnet_name

  #subnet
  subnet_names    = ["subnet1", "subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

  # route_table
  enable_route_table = true
  route_table_name   = "pub"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}

module "subnet_2" {
  source               = "../.."
  name                 = local.name
  environment          = local.environment
  label_order          = local.label_order
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.vnet_name

  #subnet
  subnet_names    = ["sub3", "sub4"]
  subnet_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]

  # route_table
  enable_route_table = true
  route_table_name   = "pvt"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}
