variable "db_name" {
  default = "test_db"
  type    = string
}

variable "db_plan" {
  default = "turtle"
  type    = string
}

variable "aws_region" {
  default = "eu-west-1"
  type    = string
}

variable "sub_domains" {
  type = list(string)
}

variable "domain" {
  type = string
}
