#####
# Locals
#####

locals {
  tags = {
    "Terraform"  = "true"
    "managed-by" = "terraform"
  }
}

#####
# SSM Documents
#####

resource "aws_ssm_document" "this" {
  count = var.enabled ? var.ssm_document_count : 0

  name            = var.ssm_document_names[count.index]
  document_type   = var.ssm_document_document_types[count.index]
  content         = var.ssm_document_contents[count.index]
  document_format = var.ssm_document_document_formats[count.index]
  target_type     = var.ssm_document_target_types[count.index]
  permissions     = var.ssm_document_permissions[count.index]

  dynamic "attachments_source" {
    for_each = var.ssm_document_attachments_sources[count.index]

    content {
      key    = attachments_source.value.key
      values = attachments_source.value.values
      name   = lookup(attachments_source.value, "name", null)
    }
  }


  tags = merge(
    local.tags,
    var.tags,
    var.ssm_document_tags,
    var.ssm_documents_tags[count.index]
  )
}

# NOTE: For some reason, the resource does NOT export it's ARN attribute. Therefore, we go fetch it with a datasource.
data "aws_ssm_document" "this" {
  count = var.enabled ? var.ssm_document_count : 0

  name = aws_ssm_document.this[count.index].name
}

#####
# IAM Policy
#####

data "aws_iam_policy_document" "this" {
  count = var.enabled && var.iam_policy_enabled ? 1 : 0

  statement {
    sid = "1"

    actions = [
      "ssm:DescribeDocument",
      "ssm:DescribeDocumentParameters",
      "ssm:DescribeDocumentPermissions",
      "ssm:GetDocument",
      "ssm:ListDocumentVersions",
      "ssm:ListDocuments",
      "ssm:ListTagsForResource",
    ]

    resources = concat(
      data.aws_ssm_document.this.*.arn,
      var.additional_ssm_document_arns
    )
  }
}

resource "aws_iam_policy" "this" {
  count = var.enabled && var.iam_policy_enabled && 0 != (var.ssm_document_count + length(var.additional_ssm_document_arns)) ? 1 : 0

  name        = var.iam_policy_name
  path        = var.iam_policy_path
  description = var.iam_policy_description
  policy      = element(concat(data.aws_iam_policy_document.this.*.json, list("")), 0)

}

resource "aws_iam_policy_attachment" "this" {
  count = var.enabled && var.iam_policy_enabled && var.iam_policy_attachment_exclusive_enabled ? 1 : 0

  name       = var.iam_policy_attachment_name
  users      = var.iam_policy_attachment_users
  roles      = var.iam_policy_attachment_roles
  groups     = var.iam_policy_attachment_groups
  policy_arn = element(concat(aws_iam_policy.this.*.arn, list("")), 0)
}

resource "aws_iam_group_policy_attachment" "this" {
  count = var.enabled && var.iam_policy_enabled && false == var.iam_policy_attachment_exclusive_enabled ? length(var.iam_policy_attachment_groups) : 0

  group      = var.iam_policy_attachment_groups[count.index]
  policy_arn = element(concat(aws_iam_policy.this.*.arn, list("")), 0)
}

resource "aws_iam_user_policy_attachment" "this" {
  count = var.enabled && var.iam_policy_enabled && false == var.iam_policy_attachment_exclusive_enabled ? length(var.iam_policy_attachment_users) : 0

  user       = var.iam_policy_attachment_users[count.index]
  policy_arn = element(concat(aws_iam_policy.this.*.arn, list("")), 0)
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.enabled && var.iam_policy_enabled && false == var.iam_policy_attachment_exclusive_enabled ? length(var.iam_policy_attachment_roles) : 0

  role       = var.iam_policy_attachment_roles[count.index]
  policy_arn = element(concat(aws_iam_policy.this.*.arn, list("")), 0)
}
