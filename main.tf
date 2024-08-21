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

  lifecycle {
    # The AMI ID must refer to an AMI that contains an operating system
    # for the `x86_64` architecture.
    precondition {
      condition     = data.aws_ami.aws_linux.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
    
    precondition {
      condition     = self.instance_type == "t3.micro"
      error_message = "EC2 instance must be a t3.micro so that I can give this demo."
    }

    # The EC2 instance must be allocated a public DNS hostname.
    postcondition {
      condition     = self.public_dns != ""
      error_message = "EC2 instance must be in a VPC that has public DNS hostnames enabled."
    }
  }
}
