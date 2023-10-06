provider aws {
  region  = var.region
}

terraform {
  backend "s3" {
    bucket         = "nubadoo-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "nubadoo-terraform-state"
  }
}
