provider "aws" {
  version    = "~> 2.28"
  region     = "ca-central-1"
  access_key = var.access_key
  secret_key = var.secret_key

  assume_role {
    role_arn     = "arn:aws:iam::700633540182:role/OrganizationAccountAccessRole"
    session_name = "fxinnovation-public-terraform-module-aws-ssm-documents"
  }
}

#####
# Context
#####

data "aws_ssm_document" "this" {
  name            = "AWS-ApplyChefRecipes"
  document_format = "JSON"
}

resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

resource "aws_iam_role" "this" {
  name = random_string.this.result

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#####
# Module
#####

module "this" {
  source = "../../"

  additional_ssm_document_arns = [
    data.aws_ssm_document.this.arn
  ]

  iam_policy_attachment_exclusive_enabled = true
  iam_policy_attachment_name              = random_string.this.result
  iam_policy_attachment_roles             = [aws_iam_role.this.name]

}
