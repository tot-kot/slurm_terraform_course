resource "yandex_vpc_network" "this" {
  name = "${local.preffix}rigel"
}

resource "yandex_vpc_subnet" "this" {
  count          = 3
  name           = "${local.preffix}rigel-${count.index}"
  zone           = var.az[count.index]
  network_id     = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[count.index]
  labels         = var.labels
}