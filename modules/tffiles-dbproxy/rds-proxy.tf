resource "aws_db_proxy" "this" {
  name                   = "${var.name}-proxy-${var.environment}-${random_id.this.hex}"
  debug_logging          = var.debug_logging
  engine_family          = var.engine_family
  idle_client_timeout    = var.idle_client_timeout
  require_tls            = var.require_tls
  role_arn               = aws_iam_role.this.arn
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.subnets

  auth {
    auth_scheme = var.auth_scheme
    description = "Access the database instance using username and password from AWS Secrets Manager"
    iam_auth    = var.iam_auth
    secret_arn  = var.result_secrets_arn
  }

  tags = var.tags
}

resource "aws_db_proxy_default_target_group" "this" {
  db_proxy_name = aws_db_proxy.this.name

  dynamic "connection_pool_config" {
    for_each = (
      var.connection_borrow_timeout != null || var.init_query != null || var.max_connections_percent != null ||
      var.max_idle_connections_percent != null || var.session_pinning_filters != null
    ) ? ["true"] : []

    content {
      connection_borrow_timeout    = var.connection_borrow_timeout
      init_query                   = var.init_query
      max_connections_percent      = var.max_connections_percent
      max_idle_connections_percent = var.max_idle_connections_percent
      session_pinning_filters      = var.session_pinning_filters
    }
  }
}

resource "aws_db_proxy_target" "this" {
  count = var.enable_dbproxy ? 1 : 0
  db_cluster_identifier  = var.db_cluster_identifier
  db_proxy_name          = aws_db_proxy.this.name
  target_group_name      = aws_db_proxy_default_target_group.this.name
}

resource "aws_db_proxy_endpoint" "this" {
  db_proxy_name          = aws_db_proxy.this.name
  db_proxy_endpoint_name = "${var.name}-endpoint-${var.environment}-${random_id.this.hex}"
  vpc_subnet_ids         = var.subnets
  target_role            = "READ_ONLY"
}