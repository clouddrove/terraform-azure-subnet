output "specific_subnet_name" {
  value       = azurerm_subnet.subnet[*].name
  description = "The name of the subnet."
}

output "specific_subnet_id" {
  value       = azurerm_subnet.subnet[*].id
  description = "The name of the subnet."
}

output "specific_subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  value       = azurerm_subnet.subnet[*].address_prefixes
}

output "default_subnet_name" {
  value       = azurerm_subnet.subnet[*].name
  description = "The name of the subnet."
}

output "default_subnet_id" {
  description = "The subnet ID."
  value       = azurerm_subnet.subnet[*].id
}

output "default_subnet_address_prefixes" {
  value       = azurerm_subnet.subnet[*].address_prefixes
  description = "The address prefixes for the subnet."
}

output "nat_gateway_id" {
  value       = azurerm_nat_gateway.natgw[*].id
  description = "The ID of the NAT Gateway."
}

output "public_ip_address" {
  value       = azurerm_public_ip.pip[*].ip_address
  description = "The IP address value that was allocated."
}

output "public_ip_id" {
  value       = azurerm_public_ip.pip[*].id
  description = " The ID of this Public IP."
}

output "route_table_id" {
  value       = var.enable_route_table ? azurerm_route_table.rt[*].id : null
  description = "The Route Table ID."
}

output "route_table_associated_subnets" {
  value       = var.enable_route_table ? azurerm_route_table.rt[*].subnets : null
  description = "The collection of Subnets associated with this route table."
}
