terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Configure the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Terraform   = "True"
  }
}
