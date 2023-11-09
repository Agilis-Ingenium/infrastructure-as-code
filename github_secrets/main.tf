resource "github_actions_secret" "psql_url" {
  repository       = "database"
  secret_name      = "psql_url"
  plaintext_value  = var.psql_url
}

# encrypted_value  = var.psql_url
