# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

resource "aws_security_group" "bastion_sg" {
  name        = "wowmall-prod-bastion-sg"
  description = "Security group for bastion server"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow all inbound traffic from vpc"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    description = "allow all outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group_rule" "allow_ssh_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}