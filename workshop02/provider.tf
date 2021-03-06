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
}

# variable "do_token" {}

provider "digitalocean" {
  token = var.DO_token
}

provider "hashicorp" {
}