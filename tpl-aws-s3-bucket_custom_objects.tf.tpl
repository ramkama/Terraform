## Aplication Symfony Parameters yml

  resource "aws_s3_bucket_object" "app-symfony_parameters_yml" {
    bucket = "${aws_s3_bucket.app.id}"
    key = "app-symfony_parameters_yml"
    content = "${template_file.app-symfony_parameters_yml.rendered}"
  }
