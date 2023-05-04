provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "app"
  environment = "test"
  label_order = ["environment", "name", ]
  location    = "North Europe"
}

module "vnet" {
  source  = "clouddrove/vnet/azure"
  version = "1.0.1"

  name                = "app"
  environment         = "test"
  label_order         = ["name", "environment"]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}

module "subnet" {
  source = "../.."

  name        = "app"
  environment = "test"

  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = join("", module.vnet.vnet_name)

  #subnet
  create_nat_gateway = true
  subnet_names       = ["subnet1", "subnet2"]
  subnet_prefixes    = ["10.0.1.0/24", "10.0.2.0/24"]

  # route_table
  enable_route_table = true
  route_table_name   = "nat_gateway"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}