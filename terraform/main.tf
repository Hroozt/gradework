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

# Reverse-proxy хост на основе стандартного образа nat-instance (NGINX, LETSENCRYPT)
resource "yandex_compute_instance" "reverse-proxy" {
  name = "proxy"
  hostname = "reverse-proxy"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8josjq21d56924jfan"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pub_subnet.id
    nat = true
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
}

#дефолтный образ для всех виртуальных машин
resource "yandex_compute_image" "default-image" {
  source_image = "fd8ofg98ci78v262j491"
}

# MySql сервер Master
resource "yandex_compute_instance" "mysqlm" {
  name = "mysqlm"
  hostname = "mysqlm"
  allow_stopping_for_update = true
  
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.default-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.first_subnet.id
    nat = false
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
}

# MySql сервер Slave
resource "yandex_compute_instance" "mysqls" {
  name = "mysqls"
  hostname = "mysqls"
  allow_stopping_for_update = true
  
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.default-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.second_subnet.id
    nat = false
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
}

# Application сервер (NGINX\WordPress)
resource "yandex_compute_instance" "application" {
  name = "application"
  hostname = "application"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {

    initialize_params {
      image_id = "${yandex_compute_image.default-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.first_subnet.id
    nat = false
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
}

# Gitlab сервер
resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"
  hostname = "gitlab"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.default-image.id}"
      size = 15
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.first_subnet.id
    nat = false
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
  
}
# Сервер мониторинга (Prometeus\Grafana\AlertManager)
resource "yandex_compute_instance" "mon" {
  name = "mon"
  hostname = "mon"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
   
    initialize_params {
      image_id = "${yandex_compute_image.default-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.first_subnet.id
    nat       = false
  }
  metadata = {
    user-data = "${file("config.yml")}"
  }
  
}