resource "aws_cloudfront_origin_access_control" "web_bucket_access_policy" {
  name                              = "allow_to_s3_from_cloud_front"
  description                       = "Allows access to an S3 web bucket from CloudFront"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}