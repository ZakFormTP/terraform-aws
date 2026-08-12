output "instance_public_ip" {
  value = module.ec2_dev.public_ip
}

output "instance_id" {
  value = module.ec2_dev.instance_id
}