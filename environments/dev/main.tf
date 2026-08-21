
# Appel du module aws-instance
module "ec2-dev" {
  source = "../../modules/aws-instance"


  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_name     = var.instance_name
  vpc_cidr          = var.vpc_cidr
  vpc_name          = var.vpc_name
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  igw_name          = var.igw_name
  sg_name           = var.sg_name
  nom_utilisateur   = var.nom_utilisateur

  aziz_ssh_public_key = var.aziz_ssh_public_key
  ansible_private_key = var.ansible_private_key
  ansible_repo_url    = var.ansible_repo_url

}


