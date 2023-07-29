resource "yandex_lb_target_group" "this" {
  name      = "${local.preffix}betelgeuse"
  region_id = "ru-central1"
  labels    = var.labels

  target {
    subnet_id = yandex_vpc_subnet.this-a.id
    address   = yandex_compute_instance.this-a.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.this-b.id
    address   = yandex_compute_instance.this-b.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.this-c.id
    address   = yandex_compute_instance.this-c.network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "this" {
  name = "${local.preffix}betelgeuse"

  listener {
    name = "${local.preffix}betelgeuse"
    port = var.nlb_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.this.id

    healthcheck {
      name = "${local.preffix}${var.nlb_healthcheck.name}"
      tcp_options {
        port = var.nlb_port
      }
    }
  }
}