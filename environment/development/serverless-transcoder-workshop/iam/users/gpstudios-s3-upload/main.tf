#####
#IAM User creation
##### 
resource "aws_iam_user" "user" {
  name          = "${var.user-name}"
  path          = "${var.iam_path}"
  force_destroy = "${var.force_destroy}"
}

resource "aws_iam_access_key" "user" {
  user = "${aws_iam_user.user.name}"
}

resource "aws_iam_user_policy" "user" {
  user   = "${aws_iam_user.user.name}"
  policy = "${file("permission.json")}"
}