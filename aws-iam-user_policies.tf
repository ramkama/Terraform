resource "aws_iam_user_policy" "prj-iam_cuplc" {

	name = "iam-cup-ec2-${var.prj_ecosystem}-${var.prj_application}"
	#(Required) Name of the policy.
	
	user = "${aws_iam_user.appuser.name}"
	#(Required) IAM user to which to attach this policy.
	
	
	#policy =
	#(Required) The policy document. This is a JSON formatted string. The heredoc syntax or file function is helpful here.
	policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
