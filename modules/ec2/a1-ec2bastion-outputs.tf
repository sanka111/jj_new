# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_bastion.arn
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "Elastic IP associated to the Bastion Host"
  value = module.ec2_bastion.public_ip
}
