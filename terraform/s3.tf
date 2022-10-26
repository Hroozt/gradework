terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "hrooztbucket"
    region     = "ru-central1"
    key        = "network/terraform.tfstate"
    access_key = " ИДентификатор токена сервисной учетной записи"
    secret_key = " токен "
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}