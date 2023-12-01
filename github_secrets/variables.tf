variable "psql_url" {
  type = string
}

variable "access_key_id" {
  type = string
}

variable "access_key_secret" {
  type =  string
}

variable "domain_name" {
  type = string
}

variable "sub_domains" {
  type    = list(string)
}
