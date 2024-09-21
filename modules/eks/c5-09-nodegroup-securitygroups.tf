resource "aws_security_group" "node_group_sg" {
  name        = "eks-node-group"
  description = "Security group for all nodes in the cluster"
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


resource "aws_security_group_rule" "allow_eks_control_plane_communication" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  source_security_group_id = aws_security_group.node_group_sg.id
}

resource "aws_security_group_rule" "allow_eks_control_plane_ingress_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  cidr_blocks = [var.cidr_blocks]
}

resource "aws_security_group_rule" "allow_eks_nodegroup_ingress_eks_sg" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.node_group_sg.id
  source_security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}
