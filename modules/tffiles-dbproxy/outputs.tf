output "aws_db_proxy_id" {
  value       = aws_db_proxy.this.id
  description = "Proxy ID"
}

output "aws_db_proxy_arn" {
  value       = aws_db_proxy.this.arn
  description = "Proxy ARN"
}

output "aws_db_proxy_write_endpoint" {
  value       = aws_db_proxy.this.endpoint
  description = "Proxy endpoint"
}

output "aws_db_proxy_read_endpoint" {
  value       = aws_db_proxy_endpoint.this.endpoint
  description = "Proxy endpoint"
}

output "aws_db_proxy_iam_role_arn" {
  value       = aws_iam_role.this.arn
  description = "The ARN of the IAM role that the proxy uses to access secrets in AWS Secrets Manager"
}