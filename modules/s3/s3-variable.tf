variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "wowmall-marketplace-prod"
}

variable "domain_name" {
  description = "The domain name for CloudFront distribution"
  default     = "example.com"  # Replace with your actual domain name
}