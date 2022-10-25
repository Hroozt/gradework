#Main network
resource "yandex_vpc_network" "gradework-net" {
  name = "gradework-net"
}

#Publilc network for Reverse-proxy
resource "yandex_vpc_subnet" "pub_subnet" {
  name           = "subnet-pub"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

#main subnet
resource "yandex_vpc_subnet" "first_subnet" {
  name           = "subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.1.0/24"]
  route_table_id = yandex_vpc_route_table.route.id
}

#slave subnet
resource "yandex_vpc_subnet" "second_subnet" {
  name           = "subnet-b"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gradework-net.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

#Static route
resource "yandex_vpc_route_table" "route" {
 name = "NAT"
  network_id = yandex_vpc_network.gradework-net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = yandex_compute_instance.reverse-proxy.network_interface.0.ip_address
  }
}

#----------#
# DNS Zone #
#----------#
resource "yandex_dns_zone" "dns" {
  name        = "hrooztxyz"
  zone        = "hroozt.xyz."
  public      = true
  private_networks = [yandex_vpc_network.gradework-net.id]
  depends_on = [ yandex_compute_instance.reverse-proxy]
}

resource "yandex_dns_recordset" "www" {
  zone_id = yandex_dns_zone.dns.id
  name    = "www"
  type    = "A"
  ttl     = 200
  data    = [yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address]

  depends_on = [yandex_compute_instance.reverse-proxy, yandex_dns_zone.dns]
}

resource "yandex_dns_recordset" "gitlab" {
  zone_id = yandex_dns_zone.dns.id
  name    = "gitlab"
  type    = "A"
  ttl     = 200
  data    = [yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address]

  depends_on = [yandex_compute_instance.reverse-proxy, yandex_dns_zone.dns]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.dns.id
  name    = "grafana"
  type    = "A"
  ttl     = 200
  data    = [yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address]

  depends_on = [yandex_compute_instance.reverse-proxy, yandex_dns_zone.dns]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = yandex_dns_zone.dns.id
  name    = "prometheus"
  type    = "A"
  ttl     = 200
  data    = [yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address]

  depends_on = [yandex_compute_instance.reverse-proxy, yandex_dns_zone.dns]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = yandex_dns_zone.dns.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 200
  data    = [yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address]

  depends_on = [yandex_compute_instance.reverse-proxy, yandex_dns_zone.dns]
}