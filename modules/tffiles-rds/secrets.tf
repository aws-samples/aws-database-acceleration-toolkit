#get values from secrets manager
locals {
  username = var.secrets_arn == "" ? var.master_username : aws_rds_cluster.this[0].master_username
  database_name = var.secrets_arn == "" ? var.database_name : aws_rds_cluster.this[0].database_name
}

data "aws_secretsmanager_secret" "get_arn" {
  count = var.secrets_arn != "" ? 1 : 0
  arn = var.secrets_arn == "" ? aws_secretsmanager_secret.this[0].arn : var.secrets_arn
}

data "aws_secretsmanager_secret_version" "get-version" {
  count = var.secrets_arn != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.get_arn[0].id
}

resource "aws_secretsmanager_secret" "this" {
  count = var.secrets_arn == "" ? 1 : 0
  name = "${var.name}-secret-${var.environment}-${random_id.this.hex}"
  
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "this" {
  count = var.secrets_arn == "" ? 1 : 0
  secret_id     = aws_secretsmanager_secret.this[0].id
  secret_string = <<EOF
{
  "username": "${local.username}",
  "password": "${random_password.master_password[0].result}",
  "database_name": "${local.database_name}",
  "host": "${aws_rds_cluster.this[0].endpoint}",
  "port": ${aws_rds_cluster.this[0].port},
  "DBClusterIdentifier": "${aws_rds_cluster.this[0].cluster_identifier}"
}
EOF
}