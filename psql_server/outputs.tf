output "db_password" {
  description = "The randomly generated password for the databases."
  value       = var.administrator_login_password != null ? var.administrator_login_password : random_password.psql_password.result
}
