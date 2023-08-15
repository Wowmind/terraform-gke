terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "4.69.1"
      }
    }

}

provider "google" {
  credentials = "credentials.json"
  project = var.project
  region = var.region
  zone = var.zone

}