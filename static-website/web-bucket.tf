resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.sub_domain_name}.${var.domain_name}"
}

resource "aws_s3_bucket_website_configuration" "web_bucket_config" {
  bucket = aws_s3_bucket.web_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

/*
resource "aws_s3_object" "site" {
  bucket       = aws_s3_bucket.web_bucket.bucket
  for_each     = fileset("${var.sub_domain_name}.${var.domain_name}", "**")
  key          = each.value
  source       = "./${var.sub_domain_name}.${var.domain_name}/${each.value}"
  content_type = "text/html"
  etag         = filemd5("./${var.sub_domain_name}.${var.domain_name}/${each.value}")
}
*/

/*
resource "aws_s3_bucket_acl" "web_bucket_acl" {
  bucket = aws_s3_bucket.web_bucket.id
  acl    = "private"
}
*/

data "aws_iam_policy_document" "allow_access_from_cloud_front" {
  version = "2012-10-17"

  statement {
    sid = "PolicyForCloudFrontPrivateContent"
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.web_bucket.arn}/*",
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    # TO DO : FIX THIS - Need for best practice on security, but is OK
    #condition {
    #  test     = "StringEquals"
    #  variable = "AWS:SourceArn"
    #  values   = [var.certificate]
    #}
  }
}

/*
resource "aws_s3_bucket_policy" "allow_access_from_cloud_front" {
  bucket = aws_s3_bucket.web_bucket.bucket
  policy = data.aws_iam_policy_document.allow_access_from_cloud_front.json
}
*/