terraform {
  required_providers {
    elephantsql = {
      source = "elephantsql/elephantsql"
    }
  }
}

resource "elephantsql_instance" "sql_turtle" {
  name   = "terraform-provider-test"
  plan   = "turtle"
  region = "amazon-web-services::eu-west-1"
}

output "psql_url" {
  sensitive = true
  value = elephantsql_instance.sql_turtle.url
}
