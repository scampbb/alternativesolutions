#####
#IAM Role creation
#####
resource "aws_iam_role" "role" {
  name = "api-gateway-lambda-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#####
#Role Policy Attachments
#####
resource "aws_iam_role_policy_attachment" "policy-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${var.lambda_policy}"
}
