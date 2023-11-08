resource "aws_cloudfront_function" "function" {
  name    = "${var.sub_domain_name}"
  runtime = "cloudfront-js-1.0"
  publish = true
  code    = file("${path.module}/function-01.js")
}
