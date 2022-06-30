terraform {
  required_version = "1.2.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.21.0"
    }

    hashicorp = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }

  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

    endpoint = "https://sgp1.digitaloceanspaces.com"
    region   = "sgp1"
    bucket   = "yj-bucket"
    key      = "aipc/day3/terraform.state"
  }
}

# variable "do_token" {}

provider "digitalocean" {
  token = var.DO_token
}

provider "hashicorp" {
}