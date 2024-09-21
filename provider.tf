# Terraform Settings Block
terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.55"
     }
  }
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
  #profile = "836468040898_AdministratorAccess-WithoutIAM"
  profile = "JJ"  
#  access_key = "xxxxxxxxxxxxx"
#  secret_key = "xxxxxxxxxxxxx"
#  token = "xxxxxxxxxxx"
}

#terraform {
#  backend "s3" {
#    bucket = "tf-state-data-plan"
#    region = "ap-southeast-1"
#    key = "tfstate"
#  }
#}