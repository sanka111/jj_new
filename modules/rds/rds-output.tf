output "db_instance_endpoint" {
  description = "The connection endpoint"
  value = module.rds_wowmall_mysql.db_instance_endpoint
}

output "db_instance_username" {
  description = "The username for connecting to the database instance"
  value       = var.username
}