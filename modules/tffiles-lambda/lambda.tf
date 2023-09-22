resource "aws_lambda_function" "this" {
  function_name = "${var.name}-lambda-${var.environment}-${random_id.this.hex}"
  role          = var.iam_role
  runtime       = var.runtime
  handler       = var.handler
  timeout       = var.timeout
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key

  tags = var.tags

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = {
      region = var.region
      secret_name = var.secret_name
    }
  }
}