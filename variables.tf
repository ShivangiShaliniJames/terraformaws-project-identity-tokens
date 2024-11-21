variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "role_arn" {
  description = "AWS IAM Role ARN for OIDC trust"
  type        = string
}
