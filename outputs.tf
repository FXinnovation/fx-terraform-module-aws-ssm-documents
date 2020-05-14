#####
# SSM Documents
#####

output "ssm_document_names" {
  value = aws_ssm_document.this.*.name
}

output "ssm_document_arns" {
  value = data.aws_ssm_document.this.*.arn
}

#####
# IAM Policy
#####

output "iam_policy_id" {
  value = element(concat(aws_iam_policy.this.*.id, list("")), 0)
}

output "iam_policy_arn" {
  value = element(concat(aws_iam_policy.this.*.arn, list("")), 0)
}

#####
# IAM Policy Attachments
#####

output "aws_iam_policy_attachment_id" {
  value = element(concat(aws_iam_policy_attachment.this.*.id, list("")), 0)
}
