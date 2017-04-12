resource "aws_autoscaling_notification" "asg" {

	depends_on = ["aws_autoscaling_group.asg"]
	
	group_names = ["${aws_autoscaling_group.asg.name}"]
	#(Required) A list of AutoScaling Group Names
	
	#notifications = [""]
	#(Required) A list of Notification Types that trigger notifications
	notifications  = [
		"autoscaling:EC2_INSTANCE_LAUNCH",
		"autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
		"autoscaling:EC2_INSTANCE_TERMINATE",
		"autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
	]
	
	topic_arn = "${aws_sns_topic.ec2_asg_notifications.arn}"
	#(Required) The Topic ARN for notifications to be sent through
	
}
