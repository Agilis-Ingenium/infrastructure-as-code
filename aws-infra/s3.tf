resource aws_s3_bucket bucket {
  bucket        = "www.${var.apex_domain}"
  force_destroy = true
}

resource aws_s3_bucket_website_configuration website_configuration {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource aws_s3_bucket_acl bucket_acl {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

data aws_iam_policy_document policy {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }
}

resource aws_s3_bucket_policy bucket_policy {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.policy.json
}
