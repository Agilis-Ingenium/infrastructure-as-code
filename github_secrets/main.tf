resource "github_actions_secret" "psql_url" {
  repository       = "database"
  secret_name      = "psql-url"
  encrypted_value  = var.psql_url
}
