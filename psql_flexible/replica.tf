resource "local_file" "psql_publisher" {
  content  = templatefile("${path.module}/psql_config_publisher.tftpl", { admin_name = var.administrator_login, pub_tables = var.replica_tables })
  filename = "./psql_config_publisher.sql"
}

resource "local_file" "psql_subscriber" {
  content  = templatefile("${path.module}/psql_config_subscriber.tftpl", { admin_name = var.administrator_login, pub_tables = var.replica_tables, server_name = azurerm_postgresql_flexible_server.psql.fqdn, admin_password = random_password.psql_password.result, db_name = azurerm_postgresql_flexible_server_database.psql_db["db2"].name })
  filename = "./psql_config_subscriber.sql"
}

/* resource "null_resource" "publisher" {
  provisioner "local-exec" {
    command = "az postgres flexible-server execute -n ${azurerm_postgresql_flexible_server.psql.name} -u ${var.administrator_login} -p ${random_password.psql_password.result} -d ${azurerm_postgresql_flexible_server_database.psql_db["db1"].name} --file-path \"./psql_config_publisher.sql\""
  }

  depends_on = [
    local_file.psql_subscriber
  ]
}

resource "null_resource" "subscriber" {
  provisioner "local-exec" {
    command = "az postgres flexible-server execute -n ${azurerm_postgresql_flexible_server.psql.name} -u ${var.administrator_login} -p ${random_password.psql_password.result} -d ${azurerm_postgresql_flexible_server_database.psql_db["db2"].name} --file-path \"./psql_config_subscriber.sql\""
  }

  depends_on = [
    local_file.psql_subscriber,
    null_resource.publisher
  ]
} */
