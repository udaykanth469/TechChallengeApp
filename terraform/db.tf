resource "azurerm_postgresql_server" "techcluster" {
  name                = "${var.name}"
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
  sku_name            = "GP_Gen5_2"             # Basic,family and cores

  storage_profile {
    storage_mb            = "51200"
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
    auto_grow             = "Enabled"
  }

  administrator_login          = "${var.db_admin_username}"
  administrator_login_password = "${var.db_admin_password}"
  version                      = "9.6"
  ssl_enforcement              = "disabled"

  tags = {
    db = "techapp"
  }
}

# output "id" {
#   value = "${azurerm_postgresql_server.db01.id}"
# }

