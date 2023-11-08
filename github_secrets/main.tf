resource "github_actions_secret" "example_secret" {
  repository       = "database"
  secret_name      = "example_secret_name2"
  plaintext_value  = var.psql_url
}
