/*
resource "aws_codedeploy_deployment_group" "foo" {
  app_name = "${aws_codedeploy_app.webapp.name}"
  #(Required) The name of the application.
  
  deployment_group_name = "devtools-cdgrp-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
  #(Required) The name of the deployment group.
  
  service_role_arn = "${aws_iam_role.codedeploy.arn}"
  #(Required) The service role ARN that allows deployments.
  
  autoscaling_groups = ["${aws_autoscaling_group.asg.name}"]
  #(Optional) Autoscaling groups associated with the deployment group.
  
  #deployment_config_name
  #(Optional) The name of the group's deployment config. The default is "CodeDeployDefault.OneAtATime".
  
  #ec2_tag_filter {}
  #(Optional) Tag filters associated with the group. See the AWS docs for details.
  
  #ec2_tag_filter {
    #key = "filterkey"
    #(Optional) The key of the tag filter.
    
    #type = "KEY_AND_VALUE"
    #(Optional) The type of the tag filter, either KEY_ONLY, VALUE_ONLY, or KEY_AND_VALUE.
    
    #value = "filtervalue"
    #(Optional) The value of the tag filter.
  #}

  #on_premises_instance_tag_filter {}
  #(Optional) On premise tag filters associated with the group. See the AWS docs for details.
  
  #trigger_configuration {}
  #(Optional) A Trigger Configuration block. Trigger Configurations are documented below.
  
  #trigger_configuration {
  #  trigger_events = ["DeploymentFailure"]
  #  trigger_name = "foo-trigger"
  #  trigger_target_arn = "foo-topic-arn"
  #}
}
*/
