
   
# AWS EC2 Instance Terraform Variables
# EC2 Instance Variables

# AWS EC2 Instance Type
variable "instance_type_bs" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair_bs" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "soeasy-k8"
}

#Variable to get public Subnet
variable "dmz_subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}

