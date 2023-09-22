output "aws_read_endpoint_fqdn" {
  description = "Fully qualified domain name"
  value = "${aws_route53_record.read_endpoint.fqdn}"
}

output "aws_write_endpoint_fqdn" {
  description = "Fully qualified domain name"
  value = "${aws_route53_record.write_endpoint.fqdn}"
}