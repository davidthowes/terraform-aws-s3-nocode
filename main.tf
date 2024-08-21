terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Configure the S3 bucket
resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Terraform   = "True"
  }
}

data "aws_ami" "aws_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] 
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
