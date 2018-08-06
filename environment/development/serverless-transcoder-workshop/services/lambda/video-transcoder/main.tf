resource "aws_lambda_function" "lambda" {
  filename         = "lambda-deployment.zip"
  function_name    = "${var.cost_centre}-${var.application_id}-${var.application_role}"
  role             = "${var.role}"
  handler          = "${var.handler}"
  source_code_hash = "${base64sha256(file("lambda-deployment.zip"))}"
  runtime          = "${var.runtime}"
  timeout          = "${var.timeout}"

  environment {
    variables = {
      ELASTIC_TRANSCODER_REGION      = "${var.region}"
      ELASTIC_TRANSCODER_PIPELINE_ID = "${var.pipeline_id}"
      SERVICE_ACCOUNT                = "${var.service_account}"
      DATABASE_URL                   = "${var.db_url}"
    }
  }

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    managedBy        = "${var.managedBy}"
  }
}

resource "aws_lambda_permission" "S3-trigger" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "${var.action}"
  function_name = "${aws_lambda_function.lambda.function_name}"
  principal     = "${var.principal}"
  source_arn    = "${var.trigger_event_source}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.bucket}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.lambda.arn}"
    events              = "${var.events}"
  }
}
