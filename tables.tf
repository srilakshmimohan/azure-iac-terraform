# Database Tables Configuration
# This file defines the tables that should be created in the Azure SQL Database
# Note: Terraform azurerm provider doesn't directly create SQL tables
# These are reference definitions for documentation and automation purposes

locals {
  database_tables = {
    users = {
      name        = "Users"
      description = "Store user information"
      columns = [
        { name = "UserID", type = "INT", primary_key = true, identity = true },
        { name = "Username", type = "NVARCHAR(100)", nullable = false, unique = true },
        { name = "Email", type = "NVARCHAR(255)", nullable = false, unique = true },
        { name = "FirstName", type = "NVARCHAR(100)", nullable = true },
        { name = "LastName", type = "NVARCHAR(100)", nullable = true },
        { name = "CreatedAt", type = "DATETIME2", nullable = false, default = "GETDATE()" },
        { name = "UpdatedAt", type = "DATETIME2", nullable = true }
      ]
    }

    products = {
      name        = "Products"
      description = "Store product catalog"
      columns = [
        { name = "ProductID", type = "INT", primary_key = true, identity = true },
        { name = "ProductName", type = "NVARCHAR(200)", nullable = false },
        { name = "Description", type = "NVARCHAR(MAX)", nullable = true },
        { name = "Price", type = "DECIMAL(10,2)", nullable = false },
        { name = "Stock", type = "INT", nullable = false, default = "0" },
        { name = "CreatedAt", type = "DATETIME2", nullable = false, default = "GETDATE()" },
        { name = "UpdatedAt", type = "DATETIME2", nullable = true }
      ]
    }

    orders = {
      name        = "Orders"
      description = "Store customer orders"
      columns = [
        { name = "OrderID", type = "INT", primary_key = true, identity = true },
        { name = "UserID", type = "INT", nullable = false, foreign_key = "Users(UserID)" },
        { name = "OrderDate", type = "DATETIME2", nullable = false, default = "GETDATE()" },
        { name = "TotalAmount", type = "DECIMAL(10,2)", nullable = false },
        { name = "Status", type = "NVARCHAR(50)", nullable = false, default = "'Pending'" },
        { name = "ShippingAddress", type = "NVARCHAR(500)", nullable = true },
        { name = "UpdatedAt", type = "DATETIME2", nullable = true }
      ]
    }

    order_items = {
      name        = "OrderItems"
      description = "Store items within orders"
      columns = [
        { name = "OrderItemID", type = "INT", primary_key = true, identity = true },
        { name = "OrderID", type = "INT", nullable = false, foreign_key = "Orders(OrderID)" },
        { name = "ProductID", type = "INT", nullable = false, foreign_key = "Products(ProductID)" },
        { name = "Quantity", type = "INT", nullable = false },
        { name = "UnitPrice", type = "DECIMAL(10,2)", nullable = false },
        { name = "Subtotal", type = "DECIMAL(10,2)", nullable = false }
      ]
    }
  }
}
