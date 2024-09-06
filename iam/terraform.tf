terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.43.1"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.43.1"
    }
  }
  required_version = ">= 1.0"
}
