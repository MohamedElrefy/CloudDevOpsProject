terraform {
  backend "s3" {
    bucket         = "ivolve-terraform-state-mohamed"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
