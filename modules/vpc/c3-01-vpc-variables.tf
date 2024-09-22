# VPC Input Variables

# VPC ID
variable "vpc_name" {
  description = "VPC name"
  type = string 
  default = "soeasy-vpc"
}

### Secondary VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  default = "10.140.0.0/16"
}

# VPC Public Subnets
variable "vpc_prod_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = [ "10.140.0.0/26", "10.140.0.64/26" ]
}

### VPC Database Subnets
##variable "vpc_prod_database_subnets" {
##  description = "VPC Database Subnets"
##  type = list(string)
##  default = [ "10.140.4.0/27", "10.140.4.32/27" ]
##}

# VPC Private Subnets
variable "vpc_prod_k8_subnets" {
  description = "VPC k8 Private Subnets"
  type = list(string)
  default = [ "10.140.1.0/24", "10.140.2.0/24" ]
}

### VPC Private Subnets
##variable "vpc_prod_private_nat_subnets" {
##  description = "VPC EKS App Subnets"
##  type = list(string)
##  default = [ "10.140.5.0/27" ]
##}
##
### VPC Create Database Subnet Group (True / False)
##variable "vpc_create_database_subnet_group" {
##  description = "VPC Create Database Subnet Group"
##  type = bool
##  default = true 
##}

# VPC Create Database Subnet Route Table (True or False)
##variable "vpc_create_database_subnet_route_table" {
##  description = "VPC Create Database Subnet Route Table"
##  type = bool
##  default = true   
##}

  
### VPC Enable NAT Gateway (True or False) 
##variable "vpc_enable_nat_gateway" {
##  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
##  type = bool
##  default = true  
##}
##
### VPC Single NAT Gateway (True or False)
##variable "vpc_single_nat_gateway" {
##  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
##  type = bool
##  default = true
##}

#Common Tags
variable "common_tags" {
  type = map(string)
}