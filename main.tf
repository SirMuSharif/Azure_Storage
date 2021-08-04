resource "azurerm_resource_group" "azschstoragetemplet" {
  name     = var.StorageResourceGroupNameUS
  location = "East US"
}

resource "azurerm_storage_account" "azschstoragetemplet" {
  name                      = var.StorageAccountNameUS
  resource_group_name       = azurerm_resource_group.azschstoragetemplet.name
  location                  = azurerm_resource_group.azschstoragetemplet.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false
}


resource "azurerm_storage_container" "azschstoragetemplet" {
  name                  = var.ContainerNameUS
  storage_account_name  = azurerm_storage_account.azschstoragetemplet.name
  container_access_type = "private"
}