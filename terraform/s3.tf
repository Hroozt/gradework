terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "hrooztbucket"
    region     = "ru-central1"
    key        = "network/terraform.tfstate"
    access_key = "YCAJEUmTcgjhqmkJx6guKcftY"
    secret_key = "YCN9hIkTVByCnsbSzpHNOqSoeCrqz1d5CtCiOR__"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}