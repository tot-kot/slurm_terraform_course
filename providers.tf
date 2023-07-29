terraform {
  required_providers {
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
  service_account_key_file = "keys/key_sa-terraform.json"
}