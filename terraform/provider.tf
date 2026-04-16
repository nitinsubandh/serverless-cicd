terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "s3-nitinsubandh-bucket-origin-v2"
    key = "lambda-cicd/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

