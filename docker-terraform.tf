terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "wep_terraform" {
  name         = "vinayvicky/wep_terraform:6"
  keep_locally = false
}

resource "docker_container" "wep_terraform" {
  image = docker_image.wep_terraform.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
