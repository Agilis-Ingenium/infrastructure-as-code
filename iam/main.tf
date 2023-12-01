resource "aws_iam_user" "s3_user" {
    name = "s3_user"
}

resource "aws_iam_user_policy" "s3_user_policy" {
  name = "s3_user_policy"
  user = aws_iam_user.s3_user.name
policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:*"
        ],
        "Resource": "*"
      }
    ]
}
EOF
}

resource "aws_iam_access_key" "access_key" {
  user    = aws_iam_user.s3_user.name
}
