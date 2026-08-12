output "instance_public_ip" {
  value = module.ec2-dev.public_ip
}

output "instance_id" {
  value = module.ec2-dev.instance_id
}

# environments/dev/main.tf
data "aws_caller_identity" "current" {}

output "test_account_id" {
  value = data.aws_caller_identity.current.account_id
}