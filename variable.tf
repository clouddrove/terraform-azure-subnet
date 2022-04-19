#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-azure-nsg"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the module creation"
}

variable "subnet_names" {
  type        = list(any)
  default     = []
  description = "List of subnet_names for the subnet."
}

variable "address_prefixes" {
  type        = list(any)
  default     = []
  description = "List of address prefixes for the subnet."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in which to create the virtual network."
}

variable "virtual_network_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network."
}

variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  default     = false
  description = " Enable or Disable network policies for the private link endpoint on the subnet. Default value is false."
}

variable "enforce_private_link_service_network_policies" {
  type        = bool
  default     = false
  description = " Enable or Disable network policies for the private link service on the subnet. Default value is false."
}

variable "service_endpoints" {
  type        = list(any)
  default     = []
  description = "The list of Service endpoints to associate with the subnet."
}

variable "delegations" {
  type        = any
  default     = []
  description = "Block of services that has to be delegated."
}

variable "create" {
  type        = string
  default     = "30m"
  description = "Used when creating the Resource Group."
}

variable "update" {
  type        = string
  default     = "30m"
  description = "Used when updating the Resource Group."
}

variable "read" {
  type        = string
  default     = "5m"
  description = "Used when retrieving the Resource Group."
}

variable "delete" {
  type        = string
  default     = "30m"
  description = "Used when deleting the Resource Group."
}
variable "enabled_nsg" {
  type        = bool
  default     = true
  description = "Flag to enable to associcate subnet with nsg."
}

variable "network_security_group_id" {
  type        = string
  default     = ""
  description = "The ID of the Network Security Group which should be associated with the Subnet."
}
