resource "yandex_vpc_network" "this" {
  name = "${local.preffix}rigel"
}

resource "yandex_vpc_subnet" "this-a" {
  name           = "${local.preffix}rigel-a"
  zone           = "ru-central1-a"
  network_id     = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[0]
  labels         = var.labels
}

resource "yandex_vpc_subnet" "this-b" {
  name           = "${local.preffix}rigel-b"
  zone           = "ru-central1-b"
  network_id     = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[1]
  labels         = var.labels
}

resource "yandex_vpc_subnet" "this-c" {
  name           = "${local.preffix}rigel-c"
  zone           = "ru-central1-c"
  network_id     = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[2]
  labels         = var.labels
}