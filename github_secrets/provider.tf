terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "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"
  owner = "agilis-ingenium"
}
