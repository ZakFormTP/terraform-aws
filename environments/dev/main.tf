# # environments/dev/main.tf
# data "aws_caller_identity" "current" {}

# output "test_account_id" {
#   value = data.aws_caller_identity.current.account_id
# }
module "ec2-dev" {
  source = "../../modules/aws-instance"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  instance_name = var.instance_name
}