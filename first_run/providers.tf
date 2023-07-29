terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.5"
    }
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.93"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
#  token = ""
#  cloud_id = ""
#  folder_id = ""
#  zone = ""
}
