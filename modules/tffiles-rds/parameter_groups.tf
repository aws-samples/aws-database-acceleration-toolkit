resource "aws_rds_cluster_parameter_group" "this" {
  count       = var.db_cluster_parameter_group_name == "" ? 1 : 0
  name        = "${var.name}-cluster-${var.environment}-pg-${random_id.this.hex}"
  family      = var.db_cluster_parameter_group_family

  parameter {
    name  = "rds.logical_replication"
    value = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "wal_sender_timeout"
    value = "0"
  }

  parameter {
    name  = "maintenance_work_mem"
    value = "1048576"
  }

  tags = var.tags
}

resource "aws_db_parameter_group" "this" {
  count  = var.db_parameter_group_name == "" ? 1 : 0
  name   = "${var.name}-db-${var.environment}-pg-${random_id.this.hex}"
  family = var.db_parameter_group_family
  
  tags = var.tags
}
