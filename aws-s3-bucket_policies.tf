resource "aws_s3_bucket_policy" "app" {
  bucket = "${aws_s3_bucket.app.id}"
  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.app.id}/*",
      "Principal": {
        "AWS": [
          "${aws_iam_user.appuser.arn}"
        ]
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "app-config" {
  bucket = "${aws_s3_bucket.app-config.id}"
  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.app-config.id}/*",
      "Principal": {
        "AWS": [
          "${aws_iam_user.appuser.arn}"
        ]
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "elb_logs" {
  bucket = "${aws_s3_bucket.elb_logs.id}"
  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.elb_logs.id}/${var.prj_environment}/AWSLogs/${data.aws_caller_identity.aws_account_id.account_id}/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.aws_elb_account_id.id}"
        ]
      }
    }
  ]
}
POLICY
}
