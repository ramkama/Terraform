# AWS Provider
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

#vpc
variable "aws_public_cidr_block" {}
variable "vpc_name" {}
variable "aws_subnet_public_cidr_block" {}
variable "vpc_create_before_destroy" {}

#AWS Subnet
variable "aws_subnet_name" {
  type = "map"
  default = {
   "0" =  "Tera-Subnet0"
   "1" =  "Tera-Subnet1"
 }
}

variable "aws_subnet_count" {}

# EC2 Launch
variable "aws_instance_ami" {}
variable "aws_instance_type" {}
variable "root_block_volume_type" {}
variable "root_block_volume_size" {}
variable "ebs_block_device_name" {}
variable "ebs_block_volume_type" {}
variable "ebs_block_volume_size" {}

variable "ec2_name" {
  type = "map"
  #default = ["Tera0", "Tera1"]
   default = {
    "0" = "Tera0"
    "1" = "Tera1"
     }
   }

variable "count_ec2_instance" {
 description = "Number of EC2 instances to launch"
}
