data aws_route53_zone zone {
  name = var.domainName
}

resource aws_route53_record zone {
  zone_id = aws_route53_zone.zone.zone_id
  name    = format("%s.%s", var.domainName, var.subDomain)
  type    = "A"
  alias {
    name                   = aws_s3_bucket.static-website.website_endpoint
    zone_id                = aws_s3_bucket.static-website.hosted_zone_id
    evaluate_target_health = true
  }
}
