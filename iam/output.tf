output "access_key_id" {
  value = aws_iam_access_key.access_key.id
}

output "access_key_secret" {
  value = aws_iam_access_key.access_key.secret
}
