variable "region" {
  description = "Cloud provider region name"
  type        = string
}

variable "project_environment" {
  description = "Business name of Kidsloop environment (e.g. test)"
  type        = string
}

variable "project_region" {
  description = "Business name of Kidsloop region (e.g. uk/in/id/vn etc)"
  type        = string
}

variable "service_owner" {
  description = "Owner of deployment (which team manages?)"
  type        = string
}

variable "project" {
  description = "The Project name"
  type        = string
  default     = "kidskube"
}

variable "tags" {
  description = "Any additional tags to add to resources deployed by this stack."
  type        = map(any)
  default     = {}
}

variable "domain" {
  description = "The name of the domain which will be used to host the Kidsloop environment (not including any microservice-specific parts)."
  type        = string
}

variable "s3_enable_versioning" {
  description = "Do we want to enable versioning in S3?"
  type        = bool
  default     = true
}
#Variables for User Service DB instance
variable "user_service_database_name" {
  description = "Database name for the User Service"
  type        = string
  default     = "user_service_db"
}

variable "user_service_db_service" {
  description = "The RDS service e.g cms, user"
  type        = string
  default     = "user"
}

variable "user_service_engine" {
  description = "RDS Database Engine type (without aurora-)"
  type        = string
  default     = "postgresql"
}

variable "user_service_engine_version" {
  description = "RDS Database Engine version"
  type        = string
  default     = "12.8"
}

variable "user_service_instance_class" {
  description = "The db instance type"
  type        = string
  default     = "db.t3.medium"
}

variable "user_service_port" {
  description = "User service PostgreSQL port"
  type        = string
  default     = "5432"
}

# Database inputs (general)
variable "vpc_id" {
  description = "The ID of your VPC"
  type        = string
}

variable "database_subnet_group" {
  description = "Database subnet group"
  type        = string
}

variable "preferred_backup_window" {
  description = "The default preferred backup window for the database clusters"
  type        = string
  default     = "00:00-00:30"
}

variable "preferred_maintenance_window" {
  description = "The default preferred maintenance window for the database clusters"
  type        = string
  default     = "mon:22:20-mon:22:50"
}

variable "skip_final_snapshot" {
  description = "If you want terraform to make a final snapshot of the db before deleting the cluster"
  type        = bool
  default     = true
}

variable "enhanced_monitoring_role_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable the creation of the enhanced monitoring IAM role. If set to `false`, the module will not create a new role and will use `rds_monitoring_role_arn` for enhanced monitoring"
  default     = true
}

variable "backup_retention" {
  description = "Database backup retention days"
  type        = number
  default     = 5
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Object containing the cloudwatch log types to be exported"

  type = object({
    mysql      = list(string)
    postgresql = list(string)
    docdb      = list(string)
  })

  default = {
    mysql      = ["audit", "error", "general", "slowquery"]
    postgresql = ["postgresql"]
    docdb      = ["audit", "profiler"]
  }
}

variable "master_username" {
  description = "Master username for the database clusters"
  type        = string
  default     = "kidsloop"
}

variable "monitoring_interval" {
  description = "Monitoring interval (in seconds)"
  type        = number
  default     = 60
}

variable "private_ip_range" {
  description = "Range of private IP addresses (used to grant access to the database with an IP CIDR range based security group rule)"
  type        = set(string)
}

# Kubernetes inputs
variable "eks_oidc_provider_arn" {
  description = "ARN of AWS EKS OIDC IAM provider (for IAM policies)"
  type        = string
}
variable "eks_oidc_provider_id" {
  description = "ID of AWS EKS OIDC IAM provider (for IAM policies)"
  type        = string
}

variable "user_service_sa_name" {
  description = "User service account name in Kubernetes"
  type        = string
  default     = "kidsloop-user-service-sa"
}

variable "user_service_namespace" {
  description = "The kubernetes namespace which the XAPI service will be deployed to"
  type        = string
  default     = "kl-apps"
}

# Logging inputs
variable "logs_bucket_id" {
  description = "ID of logs bucket"
  type        = string
}
