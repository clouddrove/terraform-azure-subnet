provider "azurerm" {
  features {}
}

locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
}

##-----------------------------------------------------------------------------
## Subnet module call.
##-----------------------------------------------------------------------------
module "subnet" {
  source               = "../.."
  name                 = local.name
  environment          = local.environment
  label_order          = local.label_order
  resource_group_name  = ["/subscription/***************"]
  location             = ["/subscription/***************"]
  virtual_network_name = ["/subscription/***************"]

  #subnet
  subnet_names    = ["subnet1", "subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

  # route_table
  enable_route_table = false
  route_table_name   = "pub"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}