#Public VPC ID
output "vpc_id" {
  value = "${aws_vpc.public.id}"
}

#Public Sub-net ID
output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

#EC2 Instance ID
output "ec2_id" {
  value = "${aws_instance.ec2.id}"
}

#EC2 Public IP
output "public_ip" {
  value = "${aws_instance.ec2.public_ip}"
}
