resource "aws_internet_gateway" "gw" {
  count   = "${var.aws_vpc_pub_enabled}"
  vpc_id  = "${aws_vpc.public.id}"

  tags {
    Name          = "VPC-iGateway-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Type          = "Public"
    Resource      = "InternetGateway"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}
