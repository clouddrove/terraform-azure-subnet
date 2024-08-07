output "specific_subnet_name" {
  value       = var.specific_name_subnet ? azurerm_subnet.subnet[*].name : null
  description = "The name of the subnet."
}

output "specific_subnet_id" {
  value       = var.specific_name_subnet ? azurerm_subnet.subnet[*].id : null
  description = "The name of the subnet."
}

output "specific_subnet_address_prefixes" {
  value       = var.specific_name_subnet ? azurerm_subnet.subnet[*].address_prefixes : null
  description = "The address prefixes for the subnet."
}

output "default_subnet_name" {
  value       = !var.specific_name_subnet ? azurerm_subnet.subnet[*].name : null
  description = "The name of the subnet."
}

output "default_subnet_id" {
  value       = !var.specific_name_subnet ? azurerm_subnet.subnet[*].id : null
  description = "The subnet ID."
}

output "default_subnet_address_prefixes" {
  value       = !var.specific_name_subnet ? azurerm_subnet.subnet[*].address_prefixes : null
  description = "The address prefixes for the subnet."
}

output "nat_gateway_id" {
  value       = var.create_nat_gateway ? azurerm_nat_gateway.natgw[0].id : null
  description = "The ID of the NAT Gateway."
}

output "public_ip_address" {
  value       = var.create_nat_gateway ? azurerm_public_ip.pip[0].ip_address : null
  description = "The IP address value that was allocated."
}

output "public_ip_id" {
  value       = var.create_nat_gateway ? azurerm_public_ip.pip[0].id : null
  description = " The ID of this Public IP."
}

output "route_table_id" {
  value       = var.enable && var.enable_route_table ? azurerm_route_table.rt[0].id : null
  description = "The Route Table ID."
}

output "route_table_associated_subnets" {
  value       = var.enable && var.enable_route_table ? azurerm_route_table.rt[*].subnets : null
  description = "The collection of Subnets associated with this route table."
}
