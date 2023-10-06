data aws_route53_zone zone {
  name = var.domainName
}

resource aws_route53_record zone {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = format("%s.%s", var.subDomain, var.domainName)
  type    = "A"
  ttl     = 300
  records = aws_s3_bucket.static-website.website_endpoint
}
