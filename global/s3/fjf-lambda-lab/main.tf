#####
#S3Bucket Resource
#####
resource "aws_s3_bucket" "s3bucket" {
  bucket = "${var.owner}-${var.application_role}"
  acl    = "private"

  tags {
    squad            = "${var.owner}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    tier             = "${var.tier}"
    managedBy        = "${var.managedBy}"
  }
}
