#####
#IAM Role creation
#####
resource "aws_iam_role" "role" {
  name = "lambda-s3-transcoder-execution-role"

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

resource "aws_iam_role_policy_attachment" "policy-1-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${var.transcoder_JobsSubmitter_policy}"
}
