# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_k8_master_instance_ids" {
  description = "List of IDs of instances"
  value       = module.k8_master.arn
}
