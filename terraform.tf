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
    bucket = "lille-zenbox-adeo-2024-tfstates"
  }
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.6.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.2.0"
    }
  }
  required_version = ">= 1.0"
}
