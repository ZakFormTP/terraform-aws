# 1. Générer une clé privée et une clé publique, et localiser
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "deployer" {
  key_name   = "ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename        = "ec2-key.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0400"
}


# 2. Appel du module aws-instance
module "ec2-dev" {
  source = "../../modules/aws-instance"

  key_name          = aws_key_pair.deployer.key_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_name     = var.instance_name
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  igw_name          = var.igw_name
  sg_name           = var.sg_name

}


