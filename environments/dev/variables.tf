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

variable "vpc_cidr" {
  description = "CIDR block du VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "vpc_name" {
  description = "Nom (tag) du VPC"
  type        = string
  default     = "vpc-dev"
}

variable "subnet_cidr" {
  description = "CIDR block du subnet"
  type        = string
  default     = "192.168.1.0/24"
}

variable "availability_zone" {
  description = "Zone de disponibilité du subnet"
  type        = string
  default     = "eu-west-3b"
}

variable "igw_name" {
  description = "Nom (tag) de l'Internet Gateway"
  type        = string
  default     = "Passerelle"

}

variable "route_destination_cidr" {
  description = "CIDR de destination de la route (sortie internet)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_name" {
  description = "Nom du security group"
  type        = string
  default     = "Acces-SSH-22"
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

variable "nom_utilisateur" {
  type        = string
  description = "Nom de l'utilisateur pour l'environnement dev"
  default     = "mon_utilisateur_dev"
}

variable "aziz_ssh_public_key" {
  description = "clé plublique ssh de l'utilisateur Aziz"
  type        = string
}

variable "ansible_private_key" {
  description = "Contenu de la cle privee de deploiement de l'utilisateur ansible"
  type        = string
  sensitive   = true
}

variable "ansible_repo_url" {
  description = "Depot Git des playbooks, en SSH"
  type        = string
  default     = "git@github.com:azizm-git/ansible-pull-config.git"
}