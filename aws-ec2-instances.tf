/*
resource "aws_instance" "ec2_instance" {
    ami = "ami-7abd0209"
	
    instance_type = "t2.micro"
	
	user_data = "${template_file.ec2-instance_userdata.rendered}"

	root_block_device {
		volume_type		= "gp2"
		volume_size		= "${var.ec2_instance-root_volume_size}"
		delete_on_termination	= true
	}
	
    tags {
        Name = "GEMv2.ZIP.ms"
    }
}
*/
