terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
module "key-pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.2"
}



provider "aws" {
  region                   = var.region
  shared_config_files      = [var.config]
  shared_credentials_files = [var.credentials]
}
