# environments/dev/main.tf
data "aws_caller_identity" "current" {}

output "test_account_id" {
  value = data.aws_caller_identity.current.account_id
}