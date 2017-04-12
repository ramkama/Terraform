resource "aws_efs_mount_target" "az-mnt" {
  count           = "${var.aws_vpc_pub_subnets_count * var.aws_vpc_pub_enabled * var.aws_efs_cluster_enabled}"
  file_system_id  = "${aws_efs_file_system.volume.id}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  #ip_address     = ""
  security_groups = ["${aws_security_group.vpc-prv-efs-mounts.id}"]
}


/*
AWS_EFS_MOUNT_TARGET
Provides an Elastic File System (EFS) mount target.

resource "aws_efs_mount_target" "alpha" {

	file_system_id
	#(Required) The ID of the file system for which the mount target is intended.
	
	subnet_id
	#(Required) The ID of the subnet to add the mount target in.
	
	ip_address
	#(Optional) The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target.
	
	security_groups
	#(Optional) A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target.

}

Attributes Reference
The following attributes are exported:
	
	id					 - The ID of the mount target.
	dns_name			 - The DNS name for the given subnet/AZ per documented convention.
	network_interface_id - The ID of the network interface that Amazon EFS created when it created the mount target.
	
**Note: The dns_name attribute is only useful if the mount target is in a VPC that has support for DNS hostnames enabled. See Using DNS with Your VPC and VPC resource in Terraform for more information.

*/
