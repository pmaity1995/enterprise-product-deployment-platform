terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket  = "enterprise-product-terraform-state-484826611947"
    key     = "enterprise-product-platform/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "dr_strategy" {
  name  = "/enterprise-product/dr/strategy"
  type  = "String"
  value = "Terraform remote state enabled with S3 versioning for disaster recovery"
}