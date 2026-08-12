variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "eu-west-3"
}

variable "cle_access" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "cle_private" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "ID de l'AMI Debian 12/13"
  type        = string
  default     = "ami-03dbc12aeff16b2d4"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  description = "Nom (tag Name) de l'instance"
  type        = string
  default     = "debian-dev"
}