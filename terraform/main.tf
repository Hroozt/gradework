terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}

# Reverse-proxy хост (NGINX, LETSENCRYPT)
resource "yandex_compute_instance" "reverse-proxy" {
  name = "reverse-proxy"
  hostname = "reverse-proxy"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.nat-instance-image.id}"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pub_subnet.id
    nat       = true
    nat_ip_address = "${var.externalIP}"
    ip_address = "${var.subnet_a_gateway}" 
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  } 
}