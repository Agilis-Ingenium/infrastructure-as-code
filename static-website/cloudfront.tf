resource "aws_cloudfront_distribution" "web_distribution" {
  origin {
    domain_name              = aws_s3_bucket.web_bucket.bucket_regional_domain_name
    origin_access_control_id = var.policy
    origin_id                = "${var.sub_domain_name}.${var.domain_name}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.sub_domain_name}.${var.domain_name}"
  default_root_object = "index.html"

#  logging_config {
#    include_cookies = false
#    bucket          = aws_s3_bucket.log_bucket.bucket_regional_domain_name
#  }

  aliases = ["${var.sub_domain_name}.${var.domain_name}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.sub_domain_name}.${var.domain_name}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # For this lab, we only deploy to minimal regions.
  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  function_association {
    event_type   = "viewer-request"
    function_arn = aws_cloudfront_function.11ty.arn
  }
}

resource "aws_cloudfront_function" "11ty" {
  name    = "11ty-redirect"
  runtime = "cloudfront-js-1.0"
  publish = true
  code    = file("${path.module}/11ty-redirect.js")
}
