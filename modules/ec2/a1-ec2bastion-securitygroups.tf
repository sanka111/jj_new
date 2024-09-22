# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

resource "aws_security_group" "bastion_sg" {
  name        = "soeasy-bastion-sg"
  description = "Security group for bastion server"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow all inbound traffic from vpc"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

