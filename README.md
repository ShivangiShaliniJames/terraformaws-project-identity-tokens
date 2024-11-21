# terraformaws-project-identity-tokens
A Terraform AWS project using JWT identity tokens and OIDC for provider authentication.

aws
Setup
To execute this configuration you will need to give Terraform access to the relevant AWS account.

More information on configuration here is available from the documentation.

Once the Terraform configuration has been applied you should save the role_arn output as you will need it later.

Terraform Stacks
You can now authenticate an AWS provider in Stacks with the following setup.

# main.tfdeploy.hcl

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    region    = <the same region you choose for the setup>
    aws_role  = <output.role_arn from earlier Terraform execution>
    aws_token = identity_token.aws.jwt
  }
}
# main.tfstack.hcl

variable "aws_token" {
  type      = string
  ephemeral = true
}

variable "aws_region" {
  type = string
}

variable "aws_role" {
  type = string
}

provider "aws" "this" {
  config {
    region = var.region
    assume_role_with_web_identity {
      role_arn           = var.aws_role
      web_identity_token = var.aws_token
    }
  }
}
