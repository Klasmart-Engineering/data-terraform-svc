module "user_service_kms" {
  # Module source
  source  = "app.terraform.io/kidsloop-infrastructure/kms/aws"
  version = "1.0.0"

  # Module inputs
  kms_description         = "The KMS key to encrypt postgres data for user service"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = merge(
    local.tags,
    {
      Name           = "${local.name_prefix}-user-svc"
      RESOURCE_GROUP = "Cryptography"
    }
  )
}
