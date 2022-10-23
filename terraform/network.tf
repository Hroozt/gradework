resource "yandex_vpc_network" "gradework-net" {
  name = "gradework-net"
}

resource "yandex_vpc_subnet" "pub_subnet" {
  name           = "subnet-pub"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_vpc_subnet" "first_subnet" {
  name           = "subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.1.0/24"]
  route_table_id = yandex_vpc_route_table.route.id
}

resource "yandex_vpc_subnet" "second_subnet" {
  name           = "subnet-b"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

resource "yandex_vpc_route_table" "route" {
  network_id = yandex_vpc_network.gradework-net.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "10.0.0.2"
  }
}