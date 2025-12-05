# Azure SQL Infrastructure as Code (Terraform)

This project automates the deployment of a secure, production-ready Azure SQL environment using Terraform. It includes resource group creation, virtual networking, subnets, network security, Azure SQL Server, Azure SQL Database, storage account, container, firewall, and database table definitions.

## 🚀 What This Project Does

- Creates an Azure Resource Group
- Deploys a Virtual Network with Subnets
- Sets up a Network Security Group (NSG)
- Sets up a firewall
- Deploys a Storage account and container
- Provisions an Azure SQL Server
- Creates an Azure SQL Database
- Defines database table schemas (Users, Products, Orders, OrderItems)
- Outputs table listings and connection details
- Uses Infrastructure as Code (IaC) with Terraform for reproducible deployments

## 🧰 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- Azure CLI logged in (`az login`)
- An active Azure subscription

## 🛠 How to Use

1. **Clone this repo:**
   ```bash
   git clone https://github.com/srilakshmimohan/azure-iac-terraform
   cd azure-iac-terraform
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan the deployment:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **View the database tables list:**
   ```bash
   terraform output database_tables_list
   terraform output database_tables_details
   ```

6. **Create the database tables:**
   After the infrastructure is deployed, run the SQL script to create the tables:
   ```bash
   # Using Azure CLI
   az sql db query -s db01-sqlserver -d app-database -U azureuser -P '<password>' -i create_tables.sql
   
   # Or use SQL Server Management Studio (SSMS) or Azure Data Studio
   # Connect to: db01-sqlserver.database.windows.net
   # Database: app-database
   # Run the create_tables.sql script
   ```

## 📊 Database Tables

The following tables are defined in this project:

| Table Name | Description | Key Columns |
|------------|-------------|-------------|
| **Users** | Store user information | UserID (PK), Username, Email, FirstName, LastName |
| **Products** | Store product catalog | ProductID (PK), ProductName, Price, Stock |
| **Orders** | Store customer orders | OrderID (PK), UserID (FK), TotalAmount, Status |
| **OrderItems** | Store items within orders | OrderItemID (PK), OrderID (FK), ProductID (FK), Quantity |

To view the complete table schemas, check the `tables.tf` file or run:
```bash
terraform output database_tables_details
```

## 📝 Infrastructure Outputs

After deployment, Terraform will output:
- SQL Server FQDN
- Database name and ID
- List of defined tables
- Table details with column names
- Connection string template

