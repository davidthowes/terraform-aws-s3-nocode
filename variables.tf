variable "region" {
  description = "The region the bucket will be deployed in. ex. us-east-1"
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket. If null, Terraform will assign a random, unique name"
  type        = string
}

variable "unused_variable" {
  description = "Variables won't be showed in no-code unless they are required, savvy users could still access them though."
  type        = string
  default     = "jdgh2178e53udh7"
}
