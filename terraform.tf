provider "google" {
  project = var.project
  region  = var.region
}

provider "google-beta" {
  project = var.project
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "arf-hermes-prd-4f51-tfstates"
  }
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.1.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.13.0"
    }
  }
  required_version = ">= 1.0"
}
