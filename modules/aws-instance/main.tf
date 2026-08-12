resource "aws_instance" "EC2project" {
  ami           = var.ami_id
  instance_type = var.instance_type
}