resource "azurerm_resource_group" "resource_group" {
  name     = ""
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = ""
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "example" {
  name                  = ""
  storage_account_id    = azurerm_storage_account.storage_account.name
}