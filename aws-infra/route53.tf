data aws_route53_zone zone {
  name = var.domain_name
}

resource aws_route53_record domain {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = format("%s.%s", var.sub_domain_name, var.domain_name)
  type    = "A"
  alias {
    name    = resource.aws_s3_bucket_website_configuration.static-website.website_domain
    zone_id = resource.aws_s3_bucket.static-website.hosted_zone_id
    evaluate_target_health = true
  }
}
