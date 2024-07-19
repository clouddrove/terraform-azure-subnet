variable "name" {
  type        = string
  default     = null
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-azure-subnet.git"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control the module creation"
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "The name of an existing resource group to be imported."
}

variable "location" {
  type        = string
  default     = null
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = []
  description = "The address prefix to use for the subnet."
}

variable "subnet_names" {
  type        = list(string)
  default     = []
  description = "A list of public subnets inside the vNet."
}

variable "private_endpoint_network_policies" {
  type        = string
  default     = "Disabled"
  description = "Possible values are Disabled, Enabled, NetworkSecurityGroupEnabled and RouteTableEnabled. Defaults to Disabled.."
}

variable "service_endpoints" {
  type        = list(string)
  default     = []
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
}

variable "subnet_enforce_private_link_service_network_policies" {
  type        = bool
  default     = true
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
}

variable "delegation" {
  description = <<EOD
Configuration delegations on subnet
object({
  name = object({
    name = string,
    actions = list(string)
  })
})
EOD
  type        = map(list(any))
  default     = {}
}

variable "specific_name_subnet" {
  type        = bool
  default     = false
  description = "fName of the specific subnet."
}

variable "specific_subnet_names" {
  type        = list(string)
  default     = [""]
  description = "A list of subnets inside the vNet."
}

variable "virtual_network_name" {
  type        = string
  default     = null
  description = "The name of the virtual network in which the subnet is created in"
}

variable "zones" {
  type        = list(string)
  default     = null
  description = "Public ip Zones to configure."
}

variable "nat_gateway_idle_timeout" {
  type        = number
  default     = 4
  description = "Idle timeout configuration in minutes for Nat Gateway"
}

variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Flag to control nat gateway creation."
}

variable "enable_route_table" {
  type        = bool
  default     = true
  description = "Flag to control route table creation."
}

variable "routes" {
  type        = list(map(string))
  default     = []
  description = "List of objects that represent the configuration of each route."
}

variable "route_table_name" {
  type        = string
  default     = null
  description = "The name of the route table."
}

variable "bgp_route_propagation_enabled" {
  type        = bool
  default     = true
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table."
}

variable "service_endpoint_policy_ids" {
  type        = list(string)
  default     = null
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
}

variable "allocation_method" {
  type        = string
  default     = "Static"
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type        = string
  default     = "Standard"
  description = "The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
}


