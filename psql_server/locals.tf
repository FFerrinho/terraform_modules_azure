locals {
  administrator_login_password = var.administrator_login_password != null ? var.administrator_login_password : random_password.psql_password.result
}
