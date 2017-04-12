resource "aws_codedeploy_app" "webapp" {
  depends_on = ["aws_autoscaling_group.asg", "aws_autoscaling_notification.asg"]
  name = "devtools-cdapp-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
}
