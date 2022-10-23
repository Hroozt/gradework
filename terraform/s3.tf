terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "hrooztbucket"
    region     = "ru-central1"
    key        = "network/terraform.tfstate"
    access_key = "YCAJEL0c4C0uQ2ATpY2r8aEdM"
    secret_key = "YCMllE2hcT4LnZ8R4OpKI9TJpwd1hX8Sniu6oGf0"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}