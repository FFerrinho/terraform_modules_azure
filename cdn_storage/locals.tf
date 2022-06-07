locals {
  # remove all alphanumeric characters
  identifier_sanitized = replace(var.identifier, "/[^[:alnum:]]/", "")
}
