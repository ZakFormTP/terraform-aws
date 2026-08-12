variable "ami_id" {
  description = "ID de l'AMI Debian 12/13"
  type        = string
  default     = "ami-03dbc12aeff16b2d4"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Nom (tag Name) de l'instance"
  type        = string
  default     = "debian-dev"
}