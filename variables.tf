#####
# Global
#####

variable "enabled" {
  description = "Whether or not to enable this module."
  default     = true
}

variable "tags" {
  description = "Map of tags that will be merged on all resources."
  default     = {}
}

#####
# SSM Documents
#####

variable "additional_ssm_document_arns" {
  description = "List of additional SSM document ARNs you want to attach to the IAM policy."
  type        = list(string)
  default     = []
}

variable "ssm_document_count" {
  description = "Number of ssm documents that were passed as variable."
  type        = number
  default     = 0
}

variable "ssm_document_names" {
  description = "Ordered list of the names of each SSM document."
  default     = []
  type        = list(string)
}

variable "ssm_document_document_formats" {
  description = "Ordered list of the formats of each SSM document."
  default     = []
  type        = list(string)
}

variable "ssm_document_document_types" {
  description = "Ordered list of the types of each SSM document."
  default     = []
  type        = list(string)
}

variable "ssm_document_contents" {
  description = "Ordered list of the contents of each SSM document."
  default     = []
  type        = list(string)
}

variable "ssm_document_types" {
  description = "Ordered list of the type of each SSM document. Accepted values are JSON and YAML."
  default     = []
  type        = list(string)
}

variable "ssm_document_target_types" {
  description = "Ordered list ofthe target type of each SSM document."
  default     = []
  type        = list(string)
}

variable "ssm_document_attachments_sources" {
  description = <<EOT
Ordered list of the attachment sources of each SSM document.
MUST follow this pattern:
```
list(
  list(
    object({
      key    = string # (Required) The key describing the location of an attachment to a document. Valid key types include: SourceUrl and S3FileUrl
      values = string # (Required) The value describing the location of an attachment to a document
      name   = string # (Optional) The name of the document attachment file
    })
  )
)
```
EOT
  default     = []
}

variable "ssm_document_permissions" {
  description = <<EOY
Ordered list of objects (or `null` to not use it) representing the permissions of each SSM document.
MUST follow the follwing pattern:
```
list(
  object({
    type        = string # (Required) The permission type for the document. The permission type can be Share.
    account_ids = any    # (Required) The AWS user accounts that should have access to the document. The account IDs can either be a group of account IDs or All.
  })
)
```
EOY
  default     = []
  type        = list(any)
}

variable "ssm_document_tags" {
  description = "Map of tags that will be applied on all SSM documents."
  default     = {}
}

variable "ssm_documents_tags" {
  description = "Ordered list of maps of tags that will be applied on each SSM cocument."
  default     = []
}

#####
# IAM
#####

variable "iam_policy_enabled" {
  description = "Whether or not to create and enabled the IAM policy."
  default     = true
}

variable "iam_policy_name" {
  description = "Name of the IAM policy."
  type        = string
  default     = null
}

variable "iam_policy_path" {
  description = "Path of the IAM policy."
  type        = string
  default     = null
}

variable "iam_policy_description" {
  description = "Description of the IAM policy."
  type        = string
  default     = null
}

variable "iam_policy_attachment_exclusive_enabled" {
  description = "Whether or not the policy should be exclusively attached to only the provided users, groups and roles."
  default     = false
}

variable "iam_policy_attachment_name" {
  description = "Name of the exclusive IAM policy attachment. Note: Required if `iam_policy_attachment_exclusive_enabled` is true."
  type        = string
  default     = null
}

variable "iam_policy_attachment_users" {
  description = "List of users to which to attach the IAM policy."
  type        = list(string)
  default     = []
}

variable "iam_policy_attachment_groups" {
  description = "List of groups to which to attach the IAM policy."
  type        = list(string)
  default     = []
}

variable "iam_policy_attachment_roles" {
  description = "List of roles to which to attach the IAM policy."
  type        = list(string)
  default     = []
}
