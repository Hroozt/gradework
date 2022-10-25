```terminal
hroozt@W10PRO_STP_737:~/gradework/terraform$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.group_vars will be created
  + resource "local_file" "group_vars" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0644"
      + filename             = "../ansible/group_vars/all.yml"
      + id                   = (known after apply)
    }

  # local_file.inventory will be created
  + resource "local_file" "inventory" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0644"
      + filename             = "../ansible/inventory.yml"
      + id                   = (known after apply)
    }

  # yandex_compute_image.default-image will be created
  + resource "yandex_compute_image" "default-image" {
      + created_at      = (known after apply)
      + folder_id       = (known after apply)
      + id              = (known after apply)
      + min_disk_size   = (known after apply)
      + os_type         = (known after apply)
      + pooled          = (known after apply)
      + product_ids     = (known after apply)
      + size            = (known after apply)
      + source_disk     = (known after apply)
      + source_family   = (known after apply)
      + source_image    = "fd8ofg98ci78v262j491"
      + source_snapshot = (known after apply)
      + source_url      = (known after apply)
      + status          = (known after apply)
    }

  # yandex_compute_instance.application will be created
  + resource "yandex_compute_instance" "application" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "application"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "application"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.gitlab will be created
  + resource "yandex_compute_instance" "gitlab" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "gitlab"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "gitlab"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = 15
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.mon will be created
  + resource "yandex_compute_instance" "mon" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "mon"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "mon"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.mysqlm will be created
  + resource "yandex_compute_instance" "mysqlm" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "mysqlm"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "mysqlm"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.mysqls will be created
  + resource "yandex_compute_instance" "mysqls" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "mysqls"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "mysqls"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.reverse-proxy will be created
  + resource "yandex_compute_instance" "reverse-proxy" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "reverse-proxy"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys"  = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6S8pfskNNzQpj1UAXR2KCScmyHUcMt6TJfSZxyXw/W6SBQbOUO9rO2uTP9Fof9vk/nfvM/oOcgk58KqDJSa4SIUpOZS4NdZjLe7UNziJAIEKCGZPAJE+/qNNqTjdfZ8t8+Xt1fy6LwGGC8QD6o8IMmhUfIkTjFeeCu6a782zCPb46mSmMWBixLNj8UVJGAsGZ8+acYg9KiAp8DHwfHaQjFgAW42lYjvU+Ts/71HKt9+pE4NLTQLbZsHk2tyLLdvtHiDOs17WrSWzqR0287+hk/iG51MbtpYUITaFz10B2DOLqE0q/RGe52H6HgynP+jXG8/MX211vywdQVUZgmk8T738VXpu21nfG0+66JCSMxIvsN02tCUnkpfL4QnzkNzOtkmtenuatUG40FGYYj3hjLTrW/4T8losa/ugnEIXxvU48iwx8fBkqFMk6MyA1o3vHbZ+rFWJ+n4ZrTqwPz8WuiqkJmxxyWz4LFqsEZBPGpRAa2GlglP1R7CJ34gzATtc= hroozt@mail.ru
            EOT
          + "user-data" = <<-EOT
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ['ALL=(ALL) NOPASSWD:ALL']
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOXZlq40yWf7KSm0thGAb0FtpUDD13oaGrie+31FJtclt5xOCqXwAF+1Y0zhSBIMK8/4OPWwRIDIuxvYb0r9zlBuMLjHTbxpgc2r5M5x736LckpSVguBUCBeKxS1P6K92wVLpjz7dC4pXnASH8YpuWcgNillbngveBlCEcRWVqbW3ASYdXv/mHXVukepOOdGaHKnsvW7lcZuW84WYNETKdZZgbM+kBzmeHw4ekGS8uval08Uk2u1bwu124Unn2/MYsS6FtbRa3Hun6RBr8p8BJsLPSrSG00iPp4l8aOTnXGJUvKOS6aE3dqatqtV8t7Qy0eRWNSHBl6Vxoc2p39ocSgSygsxkTzISbl/Yqpq/LMQREUhVe+lu2E20CjLZbdwFh8Kii8vEZXK5WmnqAjWp8f7qC9VZO77hiv2IlT1fYNDxvvSNRK1D55xW8jexMUGPOCkKQEgGT9YlWpoqTUvKni4YCKrz4LbksdpgKTJWm+BkIoTNeDhbHmtSkOpaGIUNjaDv1ChiOKemm19Fn03e7fNoXX1vxK0Eho9bBpD/iD6arSO5BOqAu6ZaSmUdULc9SigrQHp+/aru5UYgmZRplgRyQsA3fxCwUtZbmyRjvweyPg8+PckmmaFESovLxPukJK7cMjj4gYxYQyso0lr7b7ncjeBG1s72PoKrNtKn8LQ== hroozt@mail.ru
                 
            EOT
        }
      + name                      = "proxy"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8josjq21d56924jfan"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_dns_recordset.alertmanager will be created
  + resource "yandex_dns_recordset" "alertmanager" {
      + data    = (known after apply)
      + id      = (known after apply)
      + name    = "alertmanager"
      + ttl     = 200
      + type    = "A"
      + zone_id = (known after apply)
    }

  # yandex_dns_recordset.gitlab will be created
  + resource "yandex_dns_recordset" "gitlab" {
      + data    = (known after apply)
      + id      = (known after apply)
      + name    = "gitlab"
      + ttl     = 200
      + type    = "A"
      + zone_id = (known after apply)
    }

  # yandex_dns_recordset.grafana will be created
  + resource "yandex_dns_recordset" "grafana" {
      + data    = (known after apply)
      + id      = (known after apply)
      + name    = "grafana"
      + ttl     = 200
      + type    = "A"
      + zone_id = (known after apply)
    }

  # yandex_dns_recordset.prometheus will be created
  + resource "yandex_dns_recordset" "prometheus" {
      + data    = (known after apply)
      + id      = (known after apply)
      + name    = "prometheus"
      + ttl     = 200
      + type    = "A"
      + zone_id = (known after apply)
    }

  # yandex_dns_recordset.www will be created
  + resource "yandex_dns_recordset" "www" {
      + data    = (known after apply)
      + id      = (known after apply)
      + name    = "www"
      + ttl     = 200
      + type    = "A"
      + zone_id = (known after apply)
    }

  # yandex_dns_zone.dns will be created
  + resource "yandex_dns_zone" "dns" {
      + created_at       = (known after apply)
      + folder_id        = (known after apply)
      + id               = (known after apply)
      + name             = "hrooztxyz"
      + private_networks = (known after apply)
      + public           = true
      + zone             = "hroozt.xyz."
    }

  # yandex_vpc_network.gradework-net will be created
  + resource "yandex_vpc_network" "gradework-net" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "gradework-net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_route_table.route will be created
  + resource "yandex_vpc_route_table" "route" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + labels     = (known after apply)
      + name       = "NAT"
      + network_id = (known after apply)

      + static_route {
          + destination_prefix = "0.0.0.0/0"
          + next_hop_address   = (known after apply)
        }
    }

  # yandex_vpc_subnet.first_subnet will be created
  + resource "yandex_vpc_subnet" "first_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-a"
      + network_id     = (known after apply)
      + route_table_id = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # yandex_vpc_subnet.pub_subnet will be created
  + resource "yandex_vpc_subnet" "pub_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-pub"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.0.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # yandex_vpc_subnet.second_subnet will be created
  + resource "yandex_vpc_subnet" "second_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-b"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 20 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.gradework-net: Creating...
yandex_compute_image.default-image: Creating...
yandex_vpc_network.gradework-net: Creation complete after 2s [id=enpra1bvcjumqn1c4rgg]
yandex_vpc_subnet.pub_subnet: Creating...
yandex_vpc_subnet.second_subnet: Creating...
yandex_vpc_subnet.pub_subnet: Creation complete after 0s [id=e9bohg3vo9joeqmg3o8p]
yandex_compute_instance.reverse-proxy: Creating...
yandex_vpc_subnet.second_subnet: Creation complete after 1s [id=e9bdqkhsstvg1qovf44c]
yandex_compute_image.default-image: Creation complete after 10s [id=fd8fvnv6iuo3uuh19ad8]
yandex_compute_instance.mysqls: Creating...
yandex_compute_instance.reverse-proxy: Still creating... [10s elapsed]
yandex_compute_instance.mysqls: Still creating... [10s elapsed]
yandex_compute_instance.reverse-proxy: Still creating... [20s elapsed]
yandex_compute_instance.mysqls: Still creating... [20s elapsed]
yandex_compute_instance.reverse-proxy: Still creating... [30s elapsed]
yandex_compute_instance.mysqls: Still creating... [30s elapsed]
yandex_compute_instance.reverse-proxy: Still creating... [40s elapsed]
yandex_compute_instance.mysqls: Still creating... [40s elapsed]
yandex_compute_instance.reverse-proxy: Still creating... [50s elapsed]
yandex_compute_instance.reverse-proxy: Creation complete after 54s [id=fhmbnhnmib4pk0s4mscj]
yandex_dns_zone.dns: Creating...
yandex_vpc_route_table.route: Creating...
yandex_dns_zone.dns: Creation complete after 1s [id=dnsc0thbcui9oh856ovo]
yandex_dns_recordset.www: Creating...
yandex_dns_recordset.alertmanager: Creating...
yandex_dns_recordset.grafana: Creating...
yandex_dns_recordset.gitlab: Creating...
yandex_dns_recordset.prometheus: Creating...
yandex_vpc_route_table.route: Creation complete after 1s [id=enp2h6hifiojhfndgkh8]
yandex_vpc_subnet.first_subnet: Creating...
yandex_dns_recordset.gitlab: Creation complete after 1s [id=dnsc0thbcui9oh856ovo/gitlab/A]
yandex_dns_recordset.prometheus: Creation complete after 1s [id=dnsc0thbcui9oh856ovo/prometheus/A]
yandex_dns_recordset.www: Creation complete after 1s [id=dnsc0thbcui9oh856ovo/www/A]
yandex_vpc_subnet.first_subnet: Creation complete after 1s [id=e9b1o3u6q7k6ffk4qnd9]
yandex_compute_instance.mon: Creating...
yandex_compute_instance.application: Creating...
yandex_compute_instance.mysqlm: Creating...
yandex_compute_instance.gitlab: Creating...
yandex_dns_recordset.grafana: Creation complete after 2s [id=dnsc0thbcui9oh856ovo/grafana/A]
yandex_dns_recordset.alertmanager: Creation complete after 2s [id=dnsc0thbcui9oh856ovo/alertmanager/A]
yandex_compute_instance.mysqls: Still creating... [50s elapsed]
yandex_compute_instance.mysqls: Creation complete after 52s [id=fhmt631ohl8f32po9puq]
yandex_compute_instance.mon: Still creating... [10s elapsed]
yandex_compute_instance.application: Still creating... [10s elapsed]
yandex_compute_instance.mysqlm: Still creating... [10s elapsed]
yandex_compute_instance.gitlab: Still creating... [10s elapsed]
yandex_compute_instance.mysqlm: Still creating... [20s elapsed]
yandex_compute_instance.application: Still creating... [20s elapsed]
yandex_compute_instance.gitlab: Still creating... [20s elapsed]
yandex_compute_instance.mon: Still creating... [20s elapsed]
yandex_compute_instance.mon: Still creating... [30s elapsed]
yandex_compute_instance.application: Still creating... [30s elapsed]
yandex_compute_instance.gitlab: Still creating... [30s elapsed]
yandex_compute_instance.mysqlm: Still creating... [30s elapsed]
yandex_compute_instance.mysqlm: Still creating... [40s elapsed]
yandex_compute_instance.mon: Still creating... [40s elapsed]
yandex_compute_instance.gitlab: Still creating... [40s elapsed]
yandex_compute_instance.application: Still creating... [40s elapsed]
yandex_compute_instance.gitlab: Creation complete after 49s [id=fhm8qr14npk0ah7t59eq]
yandex_compute_instance.mon: Creation complete after 49s [id=fhmv3btr3bd0vjhhsq40]
yandex_compute_instance.application: Still creating... [50s elapsed]
yandex_compute_instance.mysqlm: Still creating... [50s elapsed]
yandex_compute_instance.application: Creation complete after 54s [id=fhm24765htgpjoa0o3pq]
yandex_compute_instance.mysqlm: Still creating... [1m0s elapsed]
yandex_compute_instance.mysqlm: Creation complete after 1m1s [id=fhm8g4gqnrfnfdggjq6p]
local_file.group_vars: Creating...
local_file.inventory: Creating...
local_file.group_vars: Creation complete after 0s [id=0ed401d656dca9588976f2ca3ec7a74c90ae4e48]
local_file.inventory: Creation complete after 0s [id=21a2d2295fe3d91c1351d1862fa784c744bec051]

Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

```