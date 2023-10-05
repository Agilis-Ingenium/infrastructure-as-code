# This file sets up the inital Terraform backend.
# It should be only run the first time when the account is first setup.

provider "aws" {
    region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "nubadoo-terraform-state-bucket"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    object_lock_configuration {
        object_lock_enabled = "Enabled"
    }
    tags = {
        "Name" = "S3 Terraform State Lock Table"
        "Project" = "Agile Dev"
    }
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "nubadoo-terraform-state"
    read_capacity  = 5
    write_capacity = 5
    billing_mode = "PAY_PER_REQUEST"
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
        "Project" = "AgileDev"
    }
}
