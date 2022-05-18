
# User service database outputs
output "user_service_endpoint" {
  description = "The User Service RDS Cluster endpoint"
  value       = module.user_service_cluster.rds_cluster_endpoint
}

output "user_service_db_name" {
  description = "The User Service database name"
  value       = module.user_service_cluster.rds_cluster_database_name
}

output "user_service_master_username" {
  description = "The cluster master username"
  value       = module.user_service_cluster.rds_cluster_master_username
}

output "user_service_db_password" {
  description = "The randomly generated password for User Service database"
  value       = random_password.user_service_password.result
  sensitive   = true
}

output "user_service_db_port" {
  description = "The User Service database port"
  value       = module.user_service_cluster.rds_cluster_port
}

# User service S3 outputs
output "user_assets_s3_bucket_origin_domain" {
  description = "the resources bucket origin domain to use in cloudfront"
  value       = aws_s3_bucket.user_assets_s3.bucket_regional_domain_name
}
output "user_assets_s3_bucket_id" {
  description = "the resources bucket identifier (name)"
  value       = aws_s3_bucket.user_assets_s3.id
}
output "user_assets_s3_bucket_arn" {
  description = "the resources bucket ARN"
  value       = aws_s3_bucket.user_assets_s3.arn
}

# User service IAM outputs
output "aws_iam_role_user_service_name" {
  description = "The name of the IAM role for the user service role"
  value       = aws_iam_role.user_service.name
}
output "aws_iam_role_user_service_id" {
  description = "The id of the IAM role for the user service role"
  value       = aws_iam_role.user_service.id
}
output "aws_iam_role_user_service_arn" {
  description = "The ARN of the IAM role for the user service role"
  value       = aws_iam_role.user_service.arn
}

# KMS output
output "user_service_kms_arn" {
  value       = module.user_service_kms.kms_key_arn
  description = "The ARN of the KMS key to use to encrypt the user service Postgres database"
}
