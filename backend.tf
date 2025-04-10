terraform {
  backend "s3" {
    bucket         = "john-backend-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-table"
    encrypt        = true
  }
}