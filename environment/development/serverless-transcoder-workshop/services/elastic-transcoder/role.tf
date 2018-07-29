#####
#IAM Role creation
#####
resource "aws_iam_role" "role" {
  name = "${var.cost_centre}-${var.application_id}-${var.application_role}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elastictranscoder.amazonaws.com"
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
  policy_arn = "${var.policy}"
}
