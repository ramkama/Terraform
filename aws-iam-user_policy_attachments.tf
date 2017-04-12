#resource "aws_iam_user_policy_attachment" "prj-iam_plc_att" {
#
#	user = "${aws_iam_user.prj-iam_user.name}"
#	#(Required) - The user the policy should be applied to
#
#	policy_arn = "${aws_iam_policy.policy.arn}"
#	#(Required) - The ARN of the policy you want to apply
#
#}
