resource "github_actions_secret" "psqlurl" {
  repository       = "database"
  secret_name      = "psqlurl"
  encrypted_value  = var.psqlurl
}
