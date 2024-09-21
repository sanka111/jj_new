resource "aws_security_group" "efs_sg" {
  name        = "wowmall_prod_efs_sg"
  description = "Allow NFS traffic"
  vpc_id      = var.vpc_id
 
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.140.0.0/16"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}