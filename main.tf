terraform {
  backend "s3" {
    bucket         = "terraform-state-for-nubadoo-com"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-for-nubadoo-com"
  }
}

module elephant_sql {
    source   = "./elephant_sql"
    db_name  = var.db_name
    db_plan  = var.db_plan
}

module "static-website" {
  source = "./static-website"
  for_each = toset(var.sub_domains)
  sub_domain_name = each.value
  domain_name = var.domain
}
