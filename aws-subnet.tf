resource "aws_subnet" "public" {
  count = "${var.aws_subnet_count}"
  vpc_id = "${aws_vpc.public.id}"
  cidr_block = "${var.aws_subnet_public_cidr_block}"
  tags {
    Name = "${lookup(var.aws_subnet_name, count.index)}"
 }
}
