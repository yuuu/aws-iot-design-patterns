terraform {
  required_version = "1.2.4"

  backend "s3" {
    bucket = "tfstate-aws-iot-design-patterns"
    key    = "development/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
