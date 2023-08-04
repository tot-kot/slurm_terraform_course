resource "yandex_lb_target_group" "this" {
  name      = "${local.preffix}betelgeuse"
  region_id = "ru-central1"
  labels    = var.labels

  dynamic "target" {
    for_each = yandex_compute_instance.this
    content {
      subnet_id = target.value.network_interface.0.subnet_id
      address   = target.value.network_interface.0.ip_address
    }
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
