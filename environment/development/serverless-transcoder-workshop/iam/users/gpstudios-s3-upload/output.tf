output "IAM user" {
  value = "${aws_iam_user.user.name}"
}

output "IAM key" {
  value = "${aws_iam_access_key.user.id}"
}

output "IAM secret" {
  value = "${aws_iam_access_key.user.secret}"
}
