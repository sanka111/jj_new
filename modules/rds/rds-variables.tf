variable "db_instance_identifier" {
  description = "The name of the RDS instance"
  type        = string
  default = "wowmall-prod-rds"
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.r6g.large"
}

variable "storage_type" {
  type = string
  default = "gp3"
}

variable "rds_backupWindow" {
  description = "The daily time range during which automated backups are created"
  default     = "18:00-19:00"
}

variable "rds_maintenanceWindow" {
  description = "The weekly time range during which system maintenance can occur"
  default     = "sun:19:00-sun:20:00"
}

variable "create_monitoring_role" {
  type = bool
  default = true
  
}
variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default = "wowmall"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default = "wmadmin"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 100
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "8.0"
}

variable "db_subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}
/*
variable "db_security_group_ids" {
  description = "List of VPC security group IDs to associate"
  type        = list(string)
  default = [ module.rds_sg.security_group_id ]
}
*/

variable "vpc_id" {
    description = "vpc ID"
    type = string
}

variable "cidr_blocks" {
  type = string
}

#Common Tags
variable "common_tags" {
  type = map(string)
}

