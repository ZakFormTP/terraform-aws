variable "vpc_cidr" {
  description = "CIDR block du VPC"
  type        = string
}

# variable "vpc_name" {
#     description = "Nom (tag) du VPC"
#     type        = string
# }

variable "subnet_cidr" {
  description = "CIDR block du subnet"
  type        = string
}

variable "availability_zone" {
  description = "Zone de disponibilité du subnet"
  type        = string
}

variable "igw_name" {
  description = "Nom (tag) de l'Internet Gateway"
  type        = string

}

variable "route_destination_cidr" {
  description = "CIDR de destination de la route (sortie internet)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_name" {
  description = "Nom du security group"
  type        = string
}

variable "ami_id" {
  description = "ID de l'AMI Debian 12/13"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

variable "instance_name" {
  description = "Nom (tag Name) de l'instance"
  type        = string
  default     = "debian-dev"
}

variable "nom_utilisateur" {
  type        = string
  description = "Le nom de l'utilisateur à créer via cloud-init"
}

# variable "aya_ssh_public_key" {
#   description = "clé plublique ssh de l'utilisateur Aya"
#   type        = string
# }

# variable "aziz_ssh_public_key" {
#   description = "clé plublique ssh de l'utilisateur Aziz"
#   type        = string
# }

variable "zak_ssh_public_key" {
  description = "clé plublique ssh de l'utilisateur Zak"
  type        = string
}

variable "private_key_pull" {
  description = "Secret Key pour Ansible-pull"
  type        = string
  sensitive   = true
}