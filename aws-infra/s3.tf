resource aws_s3_bucket static-website {
  bucket        = format("%s.%s", var.subDomain, var.domainName)
}

resource aws_s3_bucket_website_configuration static-website {
  bucket = aws_s3_bucket.static-website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource aws_s3_bucket_ownership_controls static-website {
  bucket = aws_s3_bucket.static-website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource aws_s3_bucket_public_access_block static-website {
  bucket = aws_s3_bucket.static-website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource aws_s3_bucket_acl static-website {
  depends_on = [
    aws_s3_bucket_ownership_controls.static-website,
    aws_s3_bucket_public_access_block.static-website,
  ]

  bucket = aws_s3_bucket.static-website.id
  acl    = "public-read"
}
