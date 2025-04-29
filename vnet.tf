resource "azurerm_virtual_network" vnet {
    name = "vnet-iac"
    resource_group_name=azurerm_resource_group.rg-iac.name
    location = azurerm_resource_group.rg-iac.location
    address_space = ["10.0.0.0/16"]
}