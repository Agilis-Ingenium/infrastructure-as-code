resource "github_actions_secret" "psql_url" {
  repository       = "database"
  secret_name      = "psql_url"
  plaintext_value  = var.psql_url
}

resource "github_actions_variable" "example_variable" {
  repository       = "database"
  variable_name    = "example_variable_name"
  value            = var.psql_url
}
