data aws_route53_zone zone {
  name = var.domainName
}

resource aws_route53_record zone {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = format("%s.%s", var.subDomain, var.domainName)
  type    = "A"
  ttl     = 300
  records = [aws_s3_bucket.static-website.website_endpoint]
}

resource aws_route53_record domain {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "bucket"
  type    = "A"

  alias {
    name    = resource.aws_s3_bucket.static-website.website_domain
    zone_id = resource.aws_s3_bucket.static-website.hosted_zone_id
  }
}
