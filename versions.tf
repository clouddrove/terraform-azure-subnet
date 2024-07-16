# Terraform version
terraform {
  required_version = ">= 1.9.1"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.112.0"
    }
  }
}
