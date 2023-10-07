terraform {
  backend "s3" {
    bucket         = "terraform-state-for-nubadoo-com"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-for-nubadoo-com"
  }
}