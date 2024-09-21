#EFS Provisioning
resource "aws_efs_file_system" "efs" {
  creation_token   = var.efs_name
  performance_mode = var.efs_performanceMode
  throughput_mode  = var.efs_throughputMode
  encrypted = "true"
  lifecycle_policy {
    transition_to_ia = var.efs_transitionToIa
  }
  tags = var.common_tags
}
 
resource "aws_efs_mount_target" "efs_mount_target_a" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.core_subnet_ids[0]
  security_groups = [aws_security_group.efs_sg.id]
}
 
resource "aws_efs_mount_target" "efs_mount_target_b" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.core_subnet_ids[1]
  security_groups = [aws_security_group.efs_sg.id]
}
