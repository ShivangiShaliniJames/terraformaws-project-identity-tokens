provider "aws" {
  region  = var.aws_region
  assume_role {
    role_arn = var.role_arn
    session_name = "github-actions-session"
    web_identity_token = file("${env:TERRAFORM_WEB_IDENTITY_TOKEN_FILE}")
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-terraform-identity-tokens"
  acl    = "private"
}
