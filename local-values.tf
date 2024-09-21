# Define Local Values in Terraform
locals {

  #name = "${local.owners}-${local.environment}"
  common_tags = {
    Environment = "Production"
    Terraform = "true"
    Project = "soeasy"
  } 
} 