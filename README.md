# Azure SQL Infrastructure as Code (Terraform)

This project automates the deployment of a secure, production-ready Azure SQL environment using Terraform. It includes resource group creation, virtual networking, subnets, network security, Azure SQL Server,storage account,container,firewall.

## 🚀 What This Project Does

- Creates an Azure Resource Group
- Deploys a Virtual Network with Subnets
- Sets up a Network Security Group (NSG)
- Sets up a firewall
- Deploys a Storage account and container
- Provisions an Azure SQL Server
- Uses Infrastructure as Code (IaC) with Terraform for reproducible deployments

## 🧰 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- Azure CLI logged in (`az login`)
- An active Azure subscription

## 🛠 How to Use

1. **Clone this repo:**
   ```bash
   git clone https://github.com/srilakshmimohan/azure-iac-terraform
   cd azure-sql-iac

