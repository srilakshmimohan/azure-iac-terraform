resource "azurerm_mssql_firewall_rule" "allow_my_ip" {
  name             = "allow_my_ip"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "188.210.212.237"
  end_ip_address   = "188.210.212.237"
}
