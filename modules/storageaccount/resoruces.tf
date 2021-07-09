resource "azurerm_resource_group" "lk-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "lk-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.lk-rg1.name
  location                 = azurerm_resource_group.lk-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "lk-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.lk-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "lkblob" {
  name                   = "lkblob"
  storage_account_name   = azurerm_storage_account.lk-sa.name
  storage_container_name = azurerm_storage_container.lk-sc.name
  type                   = "Block"
  source                 = "C:/Lini/Terraform/Demo5Modules/modules/storageaccount/Demo.zip"
}