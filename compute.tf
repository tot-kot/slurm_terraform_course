resource "yandex_compute_instance" "this" {
  count       = var.vm_count
  name        = "${local.preffix}${var.vm_name}-${count.index}"
  platform_id = "standard-v2"
  zone        = var.az[count.index % length(var.az)]
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
      image_id = data.yandex_compute_image.this.id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this[var.az[count.index % length(var.az)]].id
    nat       = false
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}
