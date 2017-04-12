/*
resource "aws_elb_attachment" "baz" {

	elb = "${aws_elb.bar.id}"
	#(Required) The name of the ELB.
	
	instance = "${aws_instance.foo.id}"
	#(Required) Instance ID to place in the ELB pool.

}
*/