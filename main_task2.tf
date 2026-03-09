terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  
  required_version = "~>1.12.0" 
}


variable "ssh_user" {
  description = "Пользователь для SSH подключения к remote Docker"
  type        = string
}

variable "ssh_host" {
  description = "IP адрес или DNS ВМ для remote Docker"
  type        = string
}

provider "docker" {
    host = "ssh://${var.ssh_user}@${var.ssh_host}"
}



resource "random_password" "mysql_root" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "mysql_user" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "example_${random_password.mysql_root.result}"

  ports {
    internal = 3306
    external = 3306
    ip = "127.0.0.1"
  }
  env = [
  "MYSQL_ROOT_PASSWORD=${random_password.mysql_root.result}",
  "MYSQL_DATABASE=wordpress",
  "MYSQL_USER=wordpress",
  "MYSQL_PASSWORD=${random_password.mysql_user.result}",
  "MYSQL_ROOT_HOST=%"
]
}


