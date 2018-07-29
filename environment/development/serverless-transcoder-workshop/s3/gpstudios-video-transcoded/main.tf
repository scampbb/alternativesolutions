#####
#S3Bucket Resource
#####
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.cost_centre}.${var.application_role}"
  acl    = "public-read"

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    tier             = "${var.tier}"
    managedBy        = "${var.managedBy}"
  }

  #Adds S3 bucket policy 
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
        "arn:aws:s3:::${var.cost_centre}.${var.application_role}/*"
    }
  ]
}
EOF
}
