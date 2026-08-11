provider "aws" {
  region     = var.aws_region
  access_key = var.cle_access
  secret_key = var.cle_private
}