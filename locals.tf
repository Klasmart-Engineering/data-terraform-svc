locals {
  region              = var.region
  project_environment = var.project_environment
  project_region      = var.project_region
  service_owner       = var.service_owner

  tags = merge(
    var.tags,
    {
      OWNER_GROUP     = var.service_owner
      OWNER_SUB_GROUP = var.service_owner
      ENVIRONMENT     = var.project_environment
      SERVICE_GROUP  = "UserService"
    }
  )

  # Passthrough
  vpc_id       = var.vpc_id
  user_kms_arn = module.user_service_kms.kms_key_arn
  name_prefix  = "${var.project}-${var.project_region}-${var.project_environment}"

  user_service_master_username = module.user_service_cluster.rds_cluster_master_username
  user_service_db_password     = random_password.user_service_password.result
  user_service_endpoint        = module.user_service_cluster.rds_cluster_endpoint
  user_service_db_port         = module.user_service_cluster.rds_cluster_port
  user_service_db_name         = module.user_service_cluster.rds_cluster_database_name
}
