resource "yandex_compute_instance" "this-a" {
  name        = "${local.preffix}${var.vm_name}-a"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"
  hostname    = "${var.vm_name}-a"
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
    subnet_id = yandex_vpc_subnet.this-a.id
    nat       = false
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "this-b" {
  name        = "${local.preffix}${var.vm_name}-b"
  platform_id = "standard-v2"
  zone        = "ru-central1-b"
  hostname    = "${var.vm_name}-b"
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
    subnet_id = yandex_vpc_subnet.this-b.id
    nat       = false
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "this-c" {
  name        = "${local.preffix}${var.vm_name}-c"
  platform_id = "standard-v2"
  zone        = "ru-central1-c"
  hostname    = "${var.vm_name}-c"
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
    subnet_id = yandex_vpc_subnet.this-c.id
    nat       = false
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}
