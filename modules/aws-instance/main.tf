resource "aws_vpc" "vpc_name" {
  cidr_block = var.vpc_cidr

  tags = {
      Name = var.vpc_name
  }
}

resource "aws_subnet" "reseau" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
      Name = var.vpc_cidr
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc_name.id

  tags = {
      Name = var.igw_name
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_vpc.vpc_name.default_route_table_id
  gateway_id             = aws_internet_gateway.ig.id
  destination_cidr_block = var.route_destination_cidr
}

resource "aws_security_group" "Serveur-GS" {
  vpc_id = aws_vpc.vpc_name.id
  name   = var.sg_name

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "EC2project" {

  # Remplacement par templatefile avec le nouveau chemin et les variables à injecter
  user_data = templatefile("${path.module}/templates/cloud-init.tpl", {
    aya_ssh_public_key  = var.aya_ssh_public_key
    aziz_ssh_public_key  = var.aziz_ssh_public_key
    zak_ssh_public_key  = var.zak_ssh_public_key
  })


  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.Serveur-GS.id]
  subnet_id                   = aws_subnet.reseau.id
  associate_public_ip_address = true

  tags = {
      Name = var.instance_name
  }

}