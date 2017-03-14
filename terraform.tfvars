
# AWS Provider
access_key = "xxxxxxxxxxxxxxx"
secret_key = "xxxxxxxxxx/xxxxxxxxxxxxxx"
region     = "eu-west-1"

# VPC

aws_public_cidr_block = "10.0.0.0/16"
vpc_name = "terraform_vpc"
vpc_create_before_destroy = "false"

# Public Subnet
aws_subnet_public_cidr_block = "10.0.0.0/25"
aws_subnet_count = "2"

# EC2 Launch
aws_instance_ami = "ami-02ace471"
aws_instance_type = "t2.micro"
root_block_volume_type = "standard"
root_block_volume_size = "10"
ebs_block_device_name = "/dev/sdg"
ebs_block_volume_type = "standard"
ebs_block_volume_size = "10"
#ec2_name = "Terraform"
count_ec2_instance = "2"
