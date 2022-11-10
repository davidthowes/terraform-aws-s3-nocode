variable "region" {
  description = "The region the bucket will be deployed in. ex. us-east-1"
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket. If null, Terraform will assign a random, unique name."
  type        = string
}

variable "prefix_name" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = "jdgh2178e53udh7"
}
