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

#####
# Module
#####

module "this" {
  source = "../../"

  additional_ssm_document_arns = [
    data.aws_ssm_document.this.arn
  ]

  iam_policy_enabled = false
}
