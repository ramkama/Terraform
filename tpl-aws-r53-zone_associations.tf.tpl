resource "aws_vpc" "primary" {
  cidr_block = "10.6.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_vpc" "secondary" {
  cidr_block = "10.7.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_route53_zone" "example" {
  name = "example.com"
  vpc_id = "${aws_vpc.primary.id}"
}

resource "aws_route53_zone_association" "secondary" {
  zone_id = "${aws_route53_zone.example.zone_id}"
  vpc_id = "${aws_vpc.secondary.id}"
}
