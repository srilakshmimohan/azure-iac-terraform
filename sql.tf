resource "azurerm_mssql_server" "sql" {
  name                         = "db01-sqlserver"
  resource_group_name          = azurerm_resource_group.rg-iac.name
  location                     = azurerm_resource_group.rg-iac.location
  version                      = "12.0"
  administrator_login          = "azureuser"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "db" {
  name      = "app-database"
  server_id = azurerm_mssql_server.sql.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "Basic"

  tags = {
    environment = "Production"
  }
}
