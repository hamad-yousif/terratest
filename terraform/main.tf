provider "aws" {
  version = "~> 2.0"
  region  = "ca-central-1"
}
terraform {
  backend "s3" {
    bucket = "hamad-secret-app"
    key    = "hamad-remote-key"
    region = "ca-central-1"
  }
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "hamadtestwebsite"
  acl    = "public-read"

  policy = <<EOF
{
  "Id": "MakePublic",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::hamadtestwebsite/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
  }
}
