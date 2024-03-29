output "subnet_name" {
  value       = module.subnet.default_subnet_name
  description = "The name of the subnet."
}

output "subnet_id" {
  value       = module.subnet.default_subnet_id
  description = "The subnet ID."
}

output "address_prefixes" {
  value       = module.subnet.default_subnet_address_prefixes
  description = "The address prefixes for the subnet."
}

output "route_table_id" {
  value       = module.subnet.route_table_id
  description = "The Route Table ID."
}

output "route_table_associated_subnets" {
  value       = module.subnet[*].route_table_associated_subnets[0]
  description = "The collection of Subnets associated with this route table."
}
