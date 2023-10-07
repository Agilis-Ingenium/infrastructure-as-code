resource "elephantsql_instance" "sql_turtle" {
  name   = var.db_name
  plan   = var.db_plan
  region = "amazon-web-services::eu-west-1"
}

output "psql_url" {
  sensitive = true
  value = elephantsql_instance.sql_turtle.url
}
