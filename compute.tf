resource "yandex_compute_instance" "this" {
  count       = 3
  name        = "${local.preffix}${var.vm_name}-${count.index}"
  platform_id = "standard-v2"
  zone        = var.az[count.index]
  hostname    = "${var.vm_name}-${count.index}"
  labels      = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
    core_fraction = 5
    gpus = 0
  }

  allow_stopping_for_update = true

  scheduling_policy {
        preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this[count.index].id
    nat       = false
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}