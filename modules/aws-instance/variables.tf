variable "ami_id" {
  description = "ID de l'AMI Debian 12/13"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nom de la paire de clés EC2 (.pem)"
  type        = string
}

variable "instance_name" {
  description = "Nom (tag Name) de l'instance"
  type        = string
  default     = "debian-instance"
}