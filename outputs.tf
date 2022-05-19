# IAM outputs
output "aws_iam_role_name" {
  description = "The name of the IAM role for the service account"
  value       = aws_iam_role.service_iam_role.name
}

output "aws_iam_role_id" {
  description = "The id of the IAM role for the service account"
  value       = aws_iam_role.service_iam_role.id
}

output "aws_iam_role_arn" {
  description = "The ARN of the IAM role for the service account"
  value       = aws_iam_role.service_iam_role.arn
}