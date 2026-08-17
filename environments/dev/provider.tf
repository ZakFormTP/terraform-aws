terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.58.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.cle_access
  secret_key = var.cle_private
}
