# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "BastionHost-soeasy"
  ami                    = data.aws_ami.amzlinux2-bs.id
  instance_type          = var.instance_type_bs
  key_name               = var.instance_keypair_bs
  #monitoring             = true
  subnet_id              = var.dmz_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  tags = var.common_tags

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y git

    # Install AWS CLI v2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws --version

    # Install Terraform
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
    terraform -version
  EOF
}
