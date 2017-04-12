resource "aws_iam_role" "ec2-instance-profile" {
  name = "iam-role-ec2-inst_profile-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
  path = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role" "codedeploy" {
  name = "iam-role-dtcd-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
