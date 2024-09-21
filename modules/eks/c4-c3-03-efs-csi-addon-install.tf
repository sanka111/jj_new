# Resource: EFS CSI Driver AddOn
# Install EFS CSI Driver using EKS Add-Ons (aws_eks_addon)
resource "aws_eks_addon" "efs_eks_addon" {
  depends_on = [ aws_iam_role_policy_attachment.efs_csi_iam_role_policy_attach]
  cluster_name = aws_eks_cluster.eks_cluster.id 
  addon_name   = "aws-efs-csi-driver"
  service_account_role_arn = aws_iam_role.efs_csi_iam_role.arn
  resolve_conflicts_on_update = "OVERWRITE"
}

