output "specific_subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.subnet2.*.name
}

output "specific_subnet_id" {
  description = "The subnet ID."
  value       = azurerm_subnet.subnet2.*.id
}

output "specific_subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  value       = azurerm_subnet.subnet2.*.address_prefixes
}

output "default_subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.subnet.*.name
}

output "default_subnet_id" {
  description = "The subnet ID."
  value       = azurerm_subnet.subnet.*.id
}

output "default_subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  value       = azurerm_subnet.subnet.*.address_prefixes
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = azurerm_nat_gateway.natgw.*.id
}

output "public_ip_address" {
  description = "The IP address value that was allocated."
  value       = azurerm_public_ip.pip.*.ip_address
}

output "public_ip_id" {
  description = " The ID of this Public IP."
  value       = azurerm_public_ip.pip.*.id
}
