resource "aws_cloudwatch_dashboard" "this" {
  dashboard_name = "${var.name}-dashboard-${var.environment}-${random_id.this.hex}"

  dashboard_body = templatefile("${path.module}/templates/rds_dashboard.tpl", {
    database_identifiers                          = var.database_identifiers
    database_max_connections_warning              = var.database_max_connections_warning
    region                                        = var.region
    }
  )
}
