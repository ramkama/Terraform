resource "aws_route_table" "public" {
  count = "${var.aws_vpc_pub_enabled}"
  
  vpc_id = "${aws_vpc.public.id}"
  
  tags {
    Name          = "VPC-Pub-RouteTbl-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Type          = "Public"
    Resource      = "RouteTables"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
	}
}
