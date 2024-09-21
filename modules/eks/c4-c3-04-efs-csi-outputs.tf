# EKS AddOn - EBS CSI Driver Outputs 
output "efs_eks_addon_arn" {
  description = "EKS AddOn - EFS CSI Driver ARN"
  value = aws_eks_addon.efs_eks_addon.arn
}
output "efs_eks_addon_id" {
  description = "EKS AddOn - EFS CSI Driver ID"
  value = aws_eks_addon.efs_eks_addon.id 
}
