resource "aws_kms_key" "this" {
  count                    = var.kms_key_id == "" ? 1 : 0
  deletion_window_in_days  = var.deletion_window_in_days
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  
  tags = var.tags
}

resource "aws_kms_alias" "this" {
  count         = var.kms_key_id == "" ? 1 : 0
  name          = "alias/${var.name}-${var.environment}-alias-${random_id.this.hex}"
  target_key_id = aws_kms_key.this[0].id
}
