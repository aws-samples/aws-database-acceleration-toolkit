data "aws_route53_zone" "selected" {
  name         = var.domain
  private_zone = var.private_zone
}

resource "aws_route53_record" "write_endpoint" {
  zone_id = data.aws_route53_zone.selected.zone_id
  count = var.enable_route53 ? 1 : 0
  name    = var.write_endpoint
  type    = var.type
  ttl     = var.ttl
  records = ["${var.internal_write_endpoint}"]
}

resource "aws_route53_record" "read_endpoint" {
  zone_id = data.aws_route53_zone.selected.zone_id
  count = var.enable_route53 ? 1 : 0
  name    = var.read_endpoint
  type    = var.type
  ttl     = var.ttl
  records = ["${var.internal_read_endpoint}"]
}