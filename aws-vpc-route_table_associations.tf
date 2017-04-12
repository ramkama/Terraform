resource "aws_route_table_association" "rta_public" {
  count           = "${var.aws_vpc_pub_enabled * var.aws_vpc_pub_subnets_count}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id  = "${aws_route_table.public.id}"
}
