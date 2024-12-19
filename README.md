# terraform-aws-s3-nocode

This module provides a no-code solution for deploying an S3 bucket using HCP Terraform. It is designed for demonstration purposes, offering a simple way to showcase the capabilities of HCP Terraform without requiring prior knowledge of Terraform configuration language.

## Features

- **No-Code Deployment**: Utilize the HCP Terraform UI to deploy the S3 bucket without writing code.
- **Predefined Configuration**: The module includes essential configurations for creating an S3 bucket.
- **Customizable Inputs**: Modify parameters like bucket name, region, and access control settings directly in the HCP Terraform interface.

## Prerequisites

- An active HCP account.
- Access to HCP Terraform.
- AWS credentials with sufficient permissions to create an S3 bucket.

## How to Use

1. **Import the Module**:
   - Log in to your HCP Terraform workspace.
   - Import this module from the registry or upload it directly to your workspace.

2. **Set Variables**:
   - In the HCP Terraform UI, configure the following variables:
     - `bucket_name`: Name of the S3 bucket.
     - `region`: AWS region for the bucket.

3. **Deploy**:
   - Initiate the deployment from the HCP Terraform UI.
   - Monitor the progress and view outputs upon completion.

4. **Access the Bucket**:
   - Use the provided bucket URL or ARN from the output section to verify deployment.

## Notes

- This module is intended for demonstration purposes only and may not be suitable for production use.
- Ensure compliance with your organization's security and compliance policies before deploying.
