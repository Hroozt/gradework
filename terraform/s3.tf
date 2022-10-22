terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "hrooztbucket"
    region     = "ru-central1"
    key        = "network/terraform.tfstate"
    access_key = "YCAJEXIbKdpLPPUIE5PSCqjMA"
    secret_key = "YCP4RJxgmPCdd1WamPHD7yhuMkjsuug4FV20yy4Q"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}