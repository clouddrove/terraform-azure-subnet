output "specific_subnet_id" {
  value       = module.name_specific_subnet.specific_subnet_id
  description = "The subnet ID."
}

output "specific_subnet_name" {
  value       = module.name_specific_subnet.specific_subnet_name
  description = "The name of the subnet."
}

output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "virtual_network_name" {
  value       = join("", module.vnet.vnet_name)
  description = "The name of the virtual network in which the subnet is created in."
}

output "address_prefixes" {
  value       = module.name_specific_subnet.specific_subnet_address_prefixes
  description = "The address prefixes for the subnet."
}

output "route_table_id" {
  value       = module.name_specific_subnet.route_table_id
  description = "The Route Table ID."
}

output "route_table_associated_subnets" {
  value       = module.name_specific_subnet[*].route_table_associated_subnets[0]
  description = "The collection of Subnets associated with this route table."
}

