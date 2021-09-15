terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.11.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.3.0"
    }
  }
}