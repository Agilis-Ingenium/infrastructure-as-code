resource "github_actions_secret" "psql_url" {
  repository       = "database"
  secret_name      = "PSQL_URL"
  plaintext_value  = var.psql_url
}

# encrypted_value  = var.psql_url

resource "github_actions_secret" "access_key_id" {
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.access_key_id
  for_each        = toset(var.sub_domains)
  repository = "${each.value}.${var.domain_name}"
}

resource "github_actions_secret" "access_key_id" {
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = var.access_key_secret
  for_each        = toset(var.sub_domains)
  repository = "${each.value}.${var.domain_name}"
}
