variable "vpc_cidr" {
    description = "CIDR block du VPC"
    type        = string
    # default     = "192.168.1.0/24"
}

# variable "vpc_name" {
#     description = "Nom (tag) du VPC"
#     type        = string
# }

variable "subnet_cidr" {
    description = "CIDR block du subnet"
    type        = string
    # default     = "192.168.1.0/24"
}

variable "availability_zone" {
    description = "Zone de disponibilité du subnet"
    type        = string
    # default     = "eu-west-3b"
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
    # default = "Acces-SSH-22"
}







variable "ami_id" {
  description = "ID de l'AMI Debian 12/13"
  type        = string
  # default     = "ami-03dbc12aeff16b2d4"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  # default     = "t3.micro"
}

variable "instance_name" {
  description = "Nom (tag Name) de l'instance"
  type        = string
  # default     = "debian-dev"
}