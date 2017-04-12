resource "aws_sns_topic" "ec2_asg_notifications" {

	name = "sns-tpc-ec2_asg-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
	#(Required) The friendly name for the SNS topic
	#Up to 256 alphanumeric characters, hyphens (-), and underscores (_) are allowed.
	
	display_name = "${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
	#(Optional) The display name for the SNS topic
	#Required for SMS subscriptions (can be up to 10 characters). Optional for other transports.

	
	#policy = ""
	#(Optional) The fully-formed AWS policy as JSON
	
	#delivery_policy = ""
	#(Optional) The SNS delivery policy

}