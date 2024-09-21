# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "BastionHost"
  ami                    = data.aws_ami.amzlinux2-bs.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.dmz_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  tags = var.common_tags
}
