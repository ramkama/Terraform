resource "aws_network_acl" "public" {
  count   = "${var.aws_vpc_pub_enabled}"
  vpc_id  = "${aws_vpc.public.id}"
}
