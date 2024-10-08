# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "k8_master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_master"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[0]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags
}

module "k8_woker" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_woker1"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[1]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags
}