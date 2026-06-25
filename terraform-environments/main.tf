terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "enterprise-product-terraform-state-484826611947"
    key    = "enterprise-product-platform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
