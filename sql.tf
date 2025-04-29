resource "azurerm_mssql_server" "sql" {
  name                         = "db01-sqlserver"
  resource_group_name          = azurerm_resource_group.rg-iac.name
  location                     = azurerm_resource_group.rg-iac.location
  version                      = "12.0"
  administrator_login          = "azureuser"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}
