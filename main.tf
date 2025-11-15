provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "Trg01" {
  name     = "rghcinode01"
  location = "eastus"
}

locals {
  vnets = {
    for i in range(var.userinput) :
    i => {
      name          = "${var.base_vnet_name}-${i}"
      address_space = ["${var.address_space_base}.${i}.0.0/16"]
    }
  }
}


resource "azurerm_virtual_network" "tvnet01" {
  for_each            = local.vnets
  name                = each.value.name
  location            = "eastus"
  resource_group_name = "rghcinode01"
  address_space       = each.value.address_space
}

output "vnet_names" {
  value = {
    for k, v in azurerm_virtual_network.tvnet01 :
    k => v.name
  }
}

output "vnet_address_spaces" {
  value = {
    for k, v in azurerm_virtual_network.tvnet01 :
    k => v.address_space
  }
}