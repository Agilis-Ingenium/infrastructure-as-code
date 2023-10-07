output "arn" {
  value = aws_acm_certificate.certificate.arn
}

output "policy" {
    value = aws_cloudfront_origin_access_control.web_bucket_access_policy.id
}