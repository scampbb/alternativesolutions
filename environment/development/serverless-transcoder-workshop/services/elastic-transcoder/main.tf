resource "aws_elastictranscoder_pipeline" "pipeline" {
  input_bucket = "${var.input_bucket}"
  name         = "${var.cost_centre}-${var.application_id}-${var.application_role}"
  role         = "${aws_iam_role.role.arn}"

  content_config = {
    bucket        = "${var.output_bucket}"
    storage_class = "${var.transcoded_storage_class}"
  }

  thumbnail_config = {
    bucket        = "${var.bucket}"
    storage_class = "${var.thumbnail_storage_class}"
  }
}
