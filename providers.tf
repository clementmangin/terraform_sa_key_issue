terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.34"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

provider "google" {
}

data "google_client_config" "this" {}
