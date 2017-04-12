resource "aws_iam_user" "appuser" {
  name = "iam-usr-${var.prj_ecosystem}-${var.prj_application}"
}
