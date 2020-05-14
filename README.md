# terraform-module-aws-ssm-documents

Template repository for public terraform modules

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | ~>2.28 |

## Providers

| Name | Version |
|------|---------|
| aws | ~>2.28 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_ssm\_document\_arns | List of additional SSM document ARNs you want to attach to the IAM policy. | `list(string)` | `[]` | no |
| enabled | Whether or not to enable this module. | `bool` | `true` | no |
| iam\_policy\_attachment\_exclusive\_enabled | Whether or not the policy should be exclusively attached to only the provided users, groups and roles. | `bool` | `false` | no |
| iam\_policy\_attachment\_groups | List of groups to which to attach the IAM policy. | `list(string)` | `[]` | no |
| iam\_policy\_attachment\_name | Name of the exclusive IAM policy attachment. Note: Required if `iam_policy_attachment_exclusive_enabled` is true. | `string` | `null` | no |
| iam\_policy\_attachment\_roles | List of roles to which to attach the IAM policy. | `list(string)` | `[]` | no |
| iam\_policy\_attachment\_users | List of users to which to attach the IAM policy. | `list(string)` | `[]` | no |
| iam\_policy\_description | Description of the IAM policy. | `string` | `null` | no |
| iam\_policy\_enabled | Whether or not to create and enabled the IAM policy. | `bool` | `true` | no |
| iam\_policy\_name | Name of the IAM policy. | `string` | `null` | no |
| iam\_policy\_path | Path of the IAM policy. | `string` | `null` | no |
| ssm\_document\_attachments\_sources | Ordered list of the attachment sources of each SSM document.<br>MUST follow this pattern:<pre>list(<br>  list(<br>    object({<br>      key    = string # (Required) The key describing the location of an attachment to a document. Valid key types include: SourceUrl and S3FileUrl<br>      values = string # (Required) The value describing the location of an attachment to a document<br>      name   = string # (Optional) The name of the document attachment file<br>    })<br>  )<br>)</pre> | `list` | `[]` | no |
| ssm\_document\_contents | Ordered list of the contents of each SSM document. | `list(string)` | `[]` | no |
| ssm\_document\_count | Number of ssm documents that were passed as variable. | `number` | `0` | no |
| ssm\_document\_document\_formats | Ordered list of the formats of each SSM document. | `list(string)` | `[]` | no |
| ssm\_document\_document\_types | Ordered list of the types of each SSM document. | `list(string)` | `[]` | no |
| ssm\_document\_names | Ordered list of the names of each SSM document. | `list(string)` | `[]` | no |
| ssm\_document\_permissions | Ordered list of objects (or `null` to not use it) representing the permissions of each SSM document.<br>MUST follow the follwing pattern:<pre>list(<br>  object({<br>    type        = string # (Required) The permission type for the document. The permission type can be Share.<br>    account_ids = any    # (Required) The AWS user accounts that should have access to the document. The account IDs can either be a group of account IDs or All.<br>  })<br>)</pre> | `list` | `[]` | no |
| ssm\_document\_tags | Map of tags that will be applied on all SSM documents. | `map` | `{}` | no |
| ssm\_document\_target\_types | Ordered list ofthe target type of each SSM document. | `list(string)` | `[]` | no |
| ssm\_document\_types | Ordered list of the type of each SSM document. Accepted values are JSON and YAML. | `list(string)` | `[]` | no |
| ssm\_documents\_tags | Ordered list of maps of tags that will be applied on each SSM cocument. | `list` | `[]` | no |
| tags | Map of tags that will be merged on all resources. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_iam\_policy\_attachment\_id | n/a |
| iam\_policy\_arn | n/a |
| iam\_policy\_id | n/a |
| ssm\_document\_arns | n/a |
| ssm\_document\_names | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
