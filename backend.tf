terraform {
  backend "s3" {
    bucket         = "terraform-identity-tokens-state"
    key            = "main.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
