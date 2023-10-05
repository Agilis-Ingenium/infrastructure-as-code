provider aws {
  region  = var.region
}

provider aws {
  region  = "us-east-1"
  alias   = "us_east_1"
}

terraform {
  backend "s3" {
    bucket         = "nubadoo-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "nubadoo-terraform-state"
  }
}
