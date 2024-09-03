output "subnet_name" {
  value       = module.subnet.default_subnet_name
  description = "The name of the subnet."
}

output "subnet_id" {
  value       = module.subnet.default_subnet_id
  description = "The subnet ID."
}

output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "virtual_network_name" {
  value       = module.vnet.vnet_name
  description = "The name of the virtual network in which the subnet is created in."
}

output "address_prefixes" {
  value       = module.subnet.default_subnet_address_prefixes
  description = "The address prefixes for the subnet."
}

output "nat_gateway_id" {
  value       = module.subnet.nat_gateway_id
  description = "The ID of the NAT Gateway."
}

output "public_ip_address" {
  value       = module.subnet.public_ip_address
  description = "The IP address value that was allocated."
}

output "public_ip_id" {
  value       = module.subnet.public_ip_id
  description = " The ID of this Public IP."
}

output "route_table_id" {
  value       = module.subnet.route_table_id
  description = "The Route Table ID."
}

output "route_table_associated_subnets" {
  value       = module.subnet[*].route_table_associated_subnets[0]
  description = "The collection of Subnets associated with this route table."
}
