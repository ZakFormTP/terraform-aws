
# Appel du module aws-instance
module "ec2-dev" {
  source = "../../modules/aws-instance"

  
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_name     = var.instance_name
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  igw_name          = var.igw_name
  sg_name           = var.sg_name
  nom_utilisateur   = var.nom_utilisateur

  # aya_ssh_public_key    = var.aya_ssh_public_key
  # aziz_ssh_public_key   = var.aziz_ssh_public_key
  zak_ssh_public_key    = var.zak_ssh_public_key
  private_key_pull  = var.private_key_pull

}


