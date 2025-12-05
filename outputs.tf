# Outputs for Azure SQL Infrastructure

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name of the Azure SQL Server"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "sql_database_name" {
  description = "Name of the Azure SQL Database"
  value       = azurerm_mssql_database.db.name
}

output "sql_database_id" {
  description = "ID of the Azure SQL Database"
  value       = azurerm_mssql_database.db.id
}

output "database_tables_list" {
  description = "List of tables defined for the database"
  value       = keys(local.database_tables)
}

output "database_tables_details" {
  description = "Detailed information about all database tables"
  value = {
    for table_key, table_config in local.database_tables : table_key => {
      name        = table_config.name
      description = table_config.description
      columns     = [for col in table_config.columns : col.name]
    }
  }
}

output "sql_connection_string" {
  description = "SQL Server connection string (without password)"
  value       = "Server=tcp:${azurerm_mssql_server.sql.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};User ID=${azurerm_mssql_server.sql.administrator_login};"
  sensitive   = false
}
