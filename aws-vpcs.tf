#Create VPC

resource "aws_vpc" public {
   cidr_block = "${var.aws_public_cidr_block}"
   # dhcp_options_id = "${var.aws_public_dhcp_options_id}"
   tags  {
     Name = "${var.vpc_name}"
 }

lifecycle {
  create_before_destroy = false
  prevent_destroy = false
 }
 
}
