resource "azurerm_storage_account" "storage" {
  name                     = "storagetest018"
  resource_group_name      = azurerm_resource_group.rg-iac.name
  location                 = azurerm_resource_group.rg-iac.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_management_lock" "tfstate_lock" {
  name       = "tfstate-lock"
  scope      = azurerm_storage_account.storage.id
  lock_level = "CanNotDelete"
  notes      = "Lock to prevent accidental deletion of the state store"
}