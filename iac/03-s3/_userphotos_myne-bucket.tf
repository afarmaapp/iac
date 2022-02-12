resource "aws_s3_bucket" "userphotos_myne"{
  bucket = "userphotos.${local.zones[terraform.workspace]}"
  acl    = "public-read"


  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1592078402474",
    "Statement": [
        {
            "Sid": "Libera acesso ao site",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:ListBucket",
                "s3:PutObject",
                "s3:GetBucketCORS",
                "s3:GetBucketWebsite",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${"userphotos.${local.zones[terraform.workspace]}"}",
                "arn:aws:s3:::${"userphotos.${local.zones[terraform.workspace]}"}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Environment = "${var.environment}"
    Name        = "Vue s3"
  }
}

