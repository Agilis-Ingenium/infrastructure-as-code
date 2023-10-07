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
    db_name  = "nubadoo"
    db_plan  = "turtle"
}
