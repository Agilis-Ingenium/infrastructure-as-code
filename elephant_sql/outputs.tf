output "psql_url" {
  sensitive = true
  value = elephantsql_instance.sql_turtle.url
}
