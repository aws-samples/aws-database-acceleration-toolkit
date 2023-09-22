resource "aws_cloudwatch_log_group" "this" {
  name = "/aws/lambda/${var.name}-lambda-${var.environment}-${random_id.this.hex}"

  retention_in_days = 3
}

resource "aws_cloudwatch_event_rule" "this" {
  name                = "${var.name}-event-rule-${var.environment}-${random_id.this.hex}"
  description         = "Fires every one minutes"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "lambda"
  arn       = aws_lambda_function.this.arn
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}