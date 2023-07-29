resource "yandex_vpc_network" "this" {
  name = "test"
}

resource "yandex_vpc_subnet" "this" {
  name = "test-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = ["10.10.1.0/24"]
}

resource "yandex_compute_instance" "this" {
  name        = "test"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
    gpus = 0
  }

  scheduling_policy {
        preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd87bs5724r0ngu3jlb6"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this.id
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }
}

output "private_ip" {
  value = yandex_compute_instance.this.network_interface.0.ip_address
}
