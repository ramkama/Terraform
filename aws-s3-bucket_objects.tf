resource "aws_s3_bucket_object" "iam-appuser_credentials" {
  bucket = "${aws_s3_bucket.app-config.id}"
  key = ".app-iam_user.credentials"
  content = "${template_file.iam-appuser_credentials.rendered}"
}

resource "aws_s3_bucket_object" "github-repository_info" {
  bucket = "${aws_s3_bucket.app-config.id}"
  key = "github-repository_info"
  content = "${template_file.github-repository_info.rendered}"
}

resource "aws_s3_bucket_object" "github-repository_sshprvkey" {
  bucket = "${aws_s3_bucket.app-config.id}"
  key = "github-repository_sshprvkey"
  content = "${template_file.github-repository_sshprvkey.rendered}"
}

## Configuration Files for Application vHost

  resource "aws_s3_bucket_object" "vhost-nginx_conf" {
    bucket = "${aws_s3_bucket.app-config.id}"
    key = "vhost-nginx_conf"
    content = "${template_file.vhost-nginx_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "vhost-phpfpm_conf" {
    bucket = "${aws_s3_bucket.app-config.id}"
    key = "vhost-phpfpm_conf"
    content = "${template_file.vhost-phpfpm_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "vhost-newrelic_conf" {
    bucket = "${aws_s3_bucket.app-config.id}"
    key = "vhost-newrelic_conf"
    content = "${template_file.vhost-newrelic_conf.rendered}"
  }

## Configuration Files for Cloudwatch Logs Monitoring Service

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_app_logs_conf" {
    bucket  = "${aws_s3_bucket.app-config.id}"
    key     = "cloudwatch-allInstances_app_logs_conf"
    content = "${template_file.cloudwatch-allInstances_app_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_gqm_qc_daemons_logs_conf" {
    bucket  = "${aws_s3_bucket.app-config.id}"
    key     = "cloudwatch-allInstances_gqm_qc_daemons_logs_conf"
    content = "${template_file.cloudwatch-allInstances_gqm_qc_daemons_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_services_logs_conf" {
    bucket  = "${aws_s3_bucket.app-config.id}"
    key     = "cloudwatch-allInstances_services_logs_conf"
    content = "${template_file.cloudwatch-allInstances_services_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_vhost_logs_conf" {
    bucket  = "${aws_s3_bucket.app-config.id}"
    key     = "cloudwatch-allInstances_vhost_logs_conf"
    content = "${template_file.cloudwatch-allInstances_vhost_logs_conf.rendered}"
  }
