terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "vinayvicky/wep_terraform" {
  name         = "vinayvicky/wep_terraform:latest"
  keep_locally = false
}

resource "docker_container" "vinayvicky/wep_terraform" {
  image = docker_image.vinayvicky/wep_terraform.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}
