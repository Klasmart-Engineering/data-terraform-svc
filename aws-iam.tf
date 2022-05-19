/* data "aws_iam_policy_document" "user_service" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]
    resources = [
      "${aws_s3_bucket.user_assets_s3.arn}"
    ]
    effect = "Allow"
  }

  statement {
    actions = [
      "s3:PutObjectAcl",
      "s3:PutObject",
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      "${aws_s3_bucket.user_assets_s3.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "data_services" {

  name = "${local.name_prefix}-user-service-sa"

  policy = data.aws_iam_policy_document.user_service.json

  tags = merge(
    local.tags,
    {
      Name           = "${local.name_prefix}-user-service-sa"
      RESOURCE_GROUP = "IAM"
    }
  )
} */

# resource "aws_iam_role" "service_iam_role" {

#   name = "${local.name_prefix}-data-services-sa"

#   assume_role_policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         Effect : "Allow",
#         Principal : {
#           "Federated" : var.eks_oidc_provider_arn
#         },
#         Action : "sts:AssumeRoleWithWebIdentity",
#         Condition : {
#           "StringEquals" : {
#             "${var.eks_oidc_provider_id}:sub" : "system:serviceaccount:${var.service_namespace}:${var.service_account_name}"
#           }
#         }
#       }
#     ]
#   })

#   tags = merge(
#     local.tags,
#     {
#       Name           = "${local.name_prefix}-data-services-sa"
#       RESOURCE_GROUP = "IAM"
#     }
#   )
# }

/* resource "aws_iam_role_policy_attachment" "data-services" {
  role       = aws_iam_role.data_services.name
  policy_arn = aws_iam_policy.data_services.arn
} */
