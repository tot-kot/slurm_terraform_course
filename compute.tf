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
    nat       = true
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
  }

  provisioner "remote-exec" {
    inline = ["ping ${self.network_interface.0.nat_ip_address} -c 3"]
    connection {
      host  = self.network_interface.0.nat_ip_address
      type  = "ssh"
      user  = "centos"
      private_key = file("~/.ssh/id_ed25519")
      agent = true
    }
  }
}

resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "ansible-playbook -u centos -i $HOSTS ansible/playbook.yml"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
      HOSTS = join(",", yandex_compute_instance.this.*.network_interface.0.nat_ip_address)
    }
  }
}
