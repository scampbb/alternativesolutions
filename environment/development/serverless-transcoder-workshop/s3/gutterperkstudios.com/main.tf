#####
#S3 Static Site Bucket
#####
resource "aws_s3_bucket" "static-site" {
  bucket        = "${var.root_zone}"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "${var.index_file}"
    error_document = "${var.error_file}"
  }

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    tier             = "${var.tier}"
    managedBy        = "${var.managedBy}"
  }

  #Add default S3 Website bucket policy 
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": 
"arn:aws:s3:::${var.root_zone}/*"
    }
  ]
}
EOF
}

#####
#S3 www redirect bucket
#####
resource "aws_s3_bucket" "redirectbucket" {
  bucket        = "${var.redirectbucket}.${var.root_zone}"
  acl           = "private"
  force_destroy = true

  website {
    redirect_all_requests_to = "${var.root_zone}"
  }

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    tier             = "${var.tier}"
    managedBy        = "${var.managedBy}"
  }
}
