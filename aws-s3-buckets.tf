resource "aws_s3_bucket" "app" {
  bucket        = "${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-app"
  acl           = "private"
  force_destroy = "true"
}

resource "aws_s3_bucket" "app-config" {
  bucket        = "${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-app-cnf"
  acl           = "private"
  force_destroy = "true"
}

resource "aws_s3_bucket" "elb_logs" {
  bucket        = "logs-ec2-elb-${var.prj_ecosystem}-${var.prj_application}"
  acl           = "private"
  force_destroy = "true"
}
