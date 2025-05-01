resource "azurerm_mssql_firewall_rule" "fw" {
  name             = "allow_internal"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "10.0.0.0"
  end_ip_address   = "10.0.0.0"
}

