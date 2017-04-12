resource "aws_iam_access_key" "appuser" {
  user = "${aws_iam_user.appuser.name}"
}
