# Launch AWS EC2 Instance

resource "aws_instance" "ec2" {
  ami = "${var.aws_instance_ami}"
  instance_type = "${var.aws_instance_type}"
  subnet_id = "${aws_subnet.public.id}"
  #ebs_optimized = true
  #vpc_security_group_ids = "${aws_subnet.public.id}"
  associate_public_ip_address = true

# Root Block Storage
  root_block_device {
     volume_type = "${var.root_block_volume_type}"
     volume_size = "${var.root_block_volume_size}"
     delete_on_termination = true
  }

# EBS Block Storage  
  ebs_block_device {
     device_name = "${var.ebs_block_device_name}"
     volume_type = "${var.ebs_block_volume_type}"
     volume_size = "${var.ebs_block_volume_size}"
     delete_on_termination = true

  }

# EC2 Name
  tags {
     Name = "${lookup(var.ec2_name, count.index)}"
  }

# Count - Number of instances to spin
  count = "${var.count_ec2_instance}"
}
