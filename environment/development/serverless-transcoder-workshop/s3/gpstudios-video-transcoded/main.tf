#####
#S3Bucket Resource
#####
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.cost_centre}.${var.application_role}"
  acl    = "private"

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    tier             = "${var.tier}"
    managedBy        = "${var.managedBy}"
  }
}
