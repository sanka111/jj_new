# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" 
  version = "5.7.0"  
  
  # VPC Basic Details
  name = var.vpc_name
  cidr = var.vpc_cidr_block
  azs  = data.aws_availability_zones.available.names
  #azs = var.vpc_availability_zones
  public_subnets  = var.vpc_prod_public_subnets
  #private_subnets = concat(var.vpc_prod_k8_subnets, var.vpc_prod_private_nat_subnets)
  private_subnets = concat(var.vpc_prod_k8_subnets)

  # Database Subnets
  ##database_subnets = var.vpc_prod_database_subnets
  ##create_database_subnet_group = var.vpc_create_database_subnet_group
  ##create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # create_database_internet_gateway_route = true     #Defalut false
  # create_database_nat_gateway_route = true          #Defalut false
  
  # NAT Gateways - Outbound Communication
  ##enable_nat_gateway = var.vpc_enable_nat_gateway 
  ##single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.common_tags
  #vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "prod-public-subnets"  
  }
  private_subnet_tags = {
    Type = "prod-k8-subnets"  
  }

  ##database_subnet_tags = {
  ##  Type = "prod-database-subnets"
  ##}
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}