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
