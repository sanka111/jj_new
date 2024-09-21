#RDS Terraform Module
module "rds_wowmall_mysql" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.5.4"

  identifier = var.db_instance_identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type

  db_name  = var.db_name
  username = var.username
  port     = "3306"

  iam_database_authentication_enabled = true
  performance_insights_enabled = true

  depends_on = [ aws_security_group.wowmall_prod_rds_sg ]
  vpc_security_group_ids = [aws_security_group.wowmall_prod_rds_sg.id]

  maintenance_window = var.rds_maintenanceWindow
  backup_window      = var.rds_backupWindow

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  #monitoring_interval    = "300"
  #monitoring_role_name   = "MyRDSMonitoringRole"
  #create_monitoring_role = var.create_monitoring_role
  tags = var.common_tags
  #tags = {
  #  Owner       = "user"
  #  Environment = "dev"
  #}

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.db_subnet_ids

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}