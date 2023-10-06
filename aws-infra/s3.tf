resource aws_s3_bucket static-website {
  bucket        = format("%s.%s", var.domainName, var.subDomain)
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

resource aws_s3_bucket_policy static-website {
  bucket = aws_s3_bucket.static-website.id
  policy = templatefile("s3-policy.json", { bucket = format("%s.%s", var.domainName, var.subDomain) })
}
