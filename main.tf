module "elephant_sql" {
  source  = "./elephant_sql"
  db_name = var.db_name
  db_plan = var.db_plan
}

module "github_secrets" {
  source   = "./github_secrets"
  psqlurl = "postgres://ofnpknxi:mIyip-QntL4PJWk_LINrtBfEklbMkSYt@flora.db.elephantsql.com/ofnpknxi"
}

module "certificate" {
  source      = "./certificate"
  domain_name = var.domain
  sub_domains = var.sub_domains
}

module "static-website" {
  source          = "./static_website"
  for_each        = toset(var.sub_domains)
  sub_domain_name = each.value
  domain_name     = var.domain
  certificate     = module.certificate.arn
  policy          = module.certificate.policy
}

module "railway" {
  source = "./railway"
}
