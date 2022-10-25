# Экспортруем данные для ansible
resource "local_file" "group_vars" {
  content         = <<-EOF
---
domain_name: hroozt.xyz
mysql_wp_database: wordpress
mysql_wp_user: wordpress
mysql_wp_password: wordpress
mysql_master: ${yandex_compute_instance.mysqlm.hostname}
mysql_master_ip: ${yandex_compute_instance.mysqlm.network_interface.0.ip_address}
mysql_slave_ip: ${yandex_compute_instance.mysqls.network_interface.0.ip_address}
mysql_host: ${yandex_compute_instance.mysqlm.network_interface.0.ip_address}
gitlab_ip: ${yandex_compute_instance.gitlab.network_interface.0.ip_address}
application_server_ip: ${yandex_compute_instance.application.network_interface.0.ip_address}
mon_ip: ${yandex_compute_instance.mon.network_interface.0.ip_address}
nginx_ip: ${yandex_compute_instance.reverse-proxy.network_interface.0.ip_address}
runner_ip: ${yandex_compute_instance.runner.network_interface.0.ip_address}
    EOF
  filename        = "../ansible/group_vars/all.yml"
  file_permission = "0644"
  
}

resource "local_file" "inventory" {
  content         = <<-EOF
---
all:
  children:
    nginx:
      hosts:
        ${yandex_compute_instance.reverse-proxy.hostname}:
          ansible_host: ${yandex_compute_instance.reverse-proxy.network_interface.0.nat_ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no"
    database:
      hosts:
        ${yandex_compute_instance.mysqlm.hostname}:
          ansible_host: ${yandex_compute_instance.mysqlm.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"
          cluster_role: 'master'
        ${yandex_compute_instance.mysqls.hostname}:
          ansible_host: ${yandex_compute_instance.mysqls.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"
          cluster_role: 'slave'
    application:
      hosts:
        ${yandex_compute_instance.application.hostname}:
          ansible_host: ${yandex_compute_instance.application.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"
    gitlab:
      hosts:
        ${yandex_compute_instance.gitlab.hostname}:
          ansible_host: ${yandex_compute_instance.gitlab.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"
    gitlab:
      hosts:
        ${yandex_compute_instance.runner.hostname}:
          ansible_host: ${yandex_compute_instance.runner.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"          
    mon:
      hosts:
        ${yandex_compute_instance.mon.hostname}:
          ansible_host: ${yandex_compute_instance.mon.network_interface.0.ip_address}
          ansible_user: ${var.os_username}
          ansible_ssh_extra_args: "-o StrictHostKeyChecking=no -J ${var.os_username}@${yandex_compute_instance.reverse-proxy.network_interface[0].nat_ip_address}"
    EOF
  filename        = "../ansible/inventory.yml"
  file_permission = "0644"
  
}