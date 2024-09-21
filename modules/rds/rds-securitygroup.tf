# AWS RDS Security Group Terraform Module
# Security Group for RDS

# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

resource "aws_security_group" "wowmall_prod_rds_sg" {
  name        = "wowmall-prod-rds-sg"
  description = "Security group for prod RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow mysql inbound traffic from vpc"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
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

resource "aws_security_group_rule" "allow_mysql_adl_jump1" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.wowmall_prod_rds_sg.id
  cidr_blocks = ["10.100.101.100/32"]
  description = "allow ssh from jump 1"
}

resource "aws_security_group_rule" "allow_mysql_adl_jump4" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.wowmall_prod_rds_sg.id
  cidr_blocks = ["10.100.101.227/32"]
  description = "allow ssh from jump 4"
}