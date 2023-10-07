data "aws_route53_zone" "domain" {
  name = var.domain_name
}

locals {
  record_types = toset(["A", "AAAA"])
}

resource "aws_route53_record" "sub_domain_record" {
  zone_id  = data.aws_route53_zone.domain.zone_id
  name     = "${var.sub_domain_name}.${var.domain_name}"
  for_each = local.record_types
  type     = each.value

  alias {
    name                   = resource.aws_s3_bucket_website_configuration.web_bucket_config.website_domain
    zone_id                = resource.aws_s3_bucket.web_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}


    