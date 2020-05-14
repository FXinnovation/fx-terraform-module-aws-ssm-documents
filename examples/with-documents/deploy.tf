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

  ssm_document_count               = 1
  ssm_document_contents            = [file("./examples/with-documents/templates/ssm_document.json")]
  ssm_document_document_formats    = ["JSON"]
  ssm_document_document_types      = ["Command"]
  ssm_document_names               = [random_string.this.result]
  ssm_document_permissions         = [null]
  ssm_document_target_types        = ["/AWS::EC2::Instance"]
  ssm_document_attachments_sources = [[]]

  iam_policy_attachment_roles = [aws_iam_role.this.name]


  ssm_document_tags = {
    foo = "bar"
  }

  ssm_documents_tags = [
    {
      far = "boo"
    }
  ]

  tags = {
    bar = "foo"
  }

}
