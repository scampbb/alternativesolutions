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
      AUTH0_DOMAIN = "${var.auth0_domain}"
    }
  }

  tags {
    cost_centre      = "${var.cost_centre}"
    application_role = "${var.application_role}"
    application_id   = "${var.application_id}"
    managedBy        = "${var.managedBy}"
  }
}
