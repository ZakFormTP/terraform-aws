module "ec2-dev" {
  source = "../../modules/aws-instance"

  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  instance_name          = var.instance_name
  vpc_cidr               = var.vpc_cidr
  subnet_cidr            = var.subnet_cidr
  availability_zone      = var.availability_zone
  igw_name               = var.igw_name
  # route_destination_cidr = var.route_destination_cidr
  sg_name                = var.sg_name

}

