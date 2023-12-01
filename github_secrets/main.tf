resource "github_actions_secret" "psql_url" {
  repository       = "database"
  secret_name      = "psql_url"
  plaintext_value  = var.psql_url
}

# encrypted_value  = var.psql_url

resource "github_actions_secret" "access_key_id" {
  secret_name      = "HELLO"
  plaintext_value  = var.access_key_id
  for_each        = toset(var.sub_domains)
  repository = "${each.value}.${var.domain}"
}
