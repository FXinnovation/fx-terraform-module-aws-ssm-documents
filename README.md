# terraform-module-aws-ssm-documents

Template repository for public terraform modules

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>2.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>2.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_ssm_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_ssm_document_arns"></a> [additional\_ssm\_document\_arns](#input\_additional\_ssm\_document\_arns) | List of additional SSM document ARNs you want to attach to the IAM policy. | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not to enable this module. | `bool` | `true` | no |
| <a name="input_iam_policy_attachment_exclusive_enabled"></a> [iam\_policy\_attachment\_exclusive\_enabled](#input\_iam\_policy\_attachment\_exclusive\_enabled) | Whether or not the policy should be exclusively attached to only the provided users, groups and roles. | `bool` | `false` | no |
| <a name="input_iam_policy_attachment_groups"></a> [iam\_policy\_attachment\_groups](#input\_iam\_policy\_attachment\_groups) | List of groups to which to attach the IAM policy. | `list(string)` | `[]` | no |
| <a name="input_iam_policy_attachment_name"></a> [iam\_policy\_attachment\_name](#input\_iam\_policy\_attachment\_name) | Name of the exclusive IAM policy attachment. Note: Required if `iam_policy_attachment_exclusive_enabled` is true. | `string` | `null` | no |
| <a name="input_iam_policy_attachment_roles"></a> [iam\_policy\_attachment\_roles](#input\_iam\_policy\_attachment\_roles) | List of roles to which to attach the IAM policy. | `list(string)` | `[]` | no |
| <a name="input_iam_policy_attachment_users"></a> [iam\_policy\_attachment\_users](#input\_iam\_policy\_attachment\_users) | List of users to which to attach the IAM policy. | `list(string)` | `[]` | no |
| <a name="input_iam_policy_description"></a> [iam\_policy\_description](#input\_iam\_policy\_description) | Description of the IAM policy. | `string` | `null` | no |
| <a name="input_iam_policy_enabled"></a> [iam\_policy\_enabled](#input\_iam\_policy\_enabled) | Whether or not to create and enabled the IAM policy. | `bool` | `true` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Name of the IAM policy. | `string` | `null` | no |
| <a name="input_iam_policy_path"></a> [iam\_policy\_path](#input\_iam\_policy\_path) | Path of the IAM policy. | `string` | `null` | no |
| <a name="input_ssm_document_attachments_sources"></a> [ssm\_document\_attachments\_sources](#input\_ssm\_document\_attachments\_sources) | Ordered list of the attachment sources of each SSM document.<br>MUST follow this pattern:<pre>list(<br>  list(<br>    object({<br>      key    = string # (Required) The key describing the location of an attachment to a document. Valid key types include: SourceUrl and S3FileUrl<br>      values = string # (Required) The value describing the location of an attachment to a document<br>      name   = string # (Optional) The name of the document attachment file<br>    })<br>  )<br>)</pre> | `list` | `[]` | no |
| <a name="input_ssm_document_contents"></a> [ssm\_document\_contents](#input\_ssm\_document\_contents) | Ordered list of the contents of each SSM document. | `list(string)` | `[]` | no |
| <a name="input_ssm_document_count"></a> [ssm\_document\_count](#input\_ssm\_document\_count) | Number of ssm documents that were passed as variable. | `number` | `0` | no |
| <a name="input_ssm_document_document_formats"></a> [ssm\_document\_document\_formats](#input\_ssm\_document\_document\_formats) | Ordered list of the formats of each SSM document. | `list(string)` | `[]` | no |
| <a name="input_ssm_document_document_types"></a> [ssm\_document\_document\_types](#input\_ssm\_document\_document\_types) | Ordered list of the types of each SSM document. | `list(string)` | `[]` | no |
| <a name="input_ssm_document_names"></a> [ssm\_document\_names](#input\_ssm\_document\_names) | Ordered list of the names of each SSM document. | `list(string)` | `[]` | no |
| <a name="input_ssm_document_permissions"></a> [ssm\_document\_permissions](#input\_ssm\_document\_permissions) | Ordered list of objects (or `null` to not use it) representing the permissions of each SSM document.<br>MUST follow the follwing pattern:<pre>list(<br>  object({<br>    type        = string # (Required) The permission type for the document. The permission type can be Share.<br>    account_ids = any    # (Required) The AWS user accounts that should have access to the document. The account IDs can either be a group of account IDs or All.<br>  })<br>)</pre> | `list(any)` | `[]` | no |
| <a name="input_ssm_document_tags"></a> [ssm\_document\_tags](#input\_ssm\_document\_tags) | Map of tags that will be applied on all SSM documents. | `map` | `{}` | no |
| <a name="input_ssm_document_target_types"></a> [ssm\_document\_target\_types](#input\_ssm\_document\_target\_types) | Ordered list ofthe target type of each SSM document. | `list(string)` | `[]` | no |
| <a name="input_ssm_document_types"></a> [ssm\_document\_types](#input\_ssm\_document\_types) | Ordered list of the type of each SSM document. Accepted values are JSON and YAML. | `list(string)` | `[]` | no |
| <a name="input_ssm_documents_tags"></a> [ssm\_documents\_tags](#input\_ssm\_documents\_tags) | Ordered list of maps of tags that will be applied on each SSM cocument. | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags that will be merged on all resources. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_iam_policy_attachment_id"></a> [aws\_iam\_policy\_attachment\_id](#output\_aws\_iam\_policy\_attachment\_id) | n/a |
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | n/a |
| <a name="output_iam_policy_id"></a> [iam\_policy\_id](#output\_iam\_policy\_id) | n/a |
| <a name="output_ssm_document_arns"></a> [ssm\_document\_arns](#output\_ssm\_document\_arns) | n/a |
| <a name="output_ssm_document_names"></a> [ssm\_document\_names](#output\_ssm\_document\_names) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
