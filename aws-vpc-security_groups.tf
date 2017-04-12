/*
AWS_SECURITY_GROUP
Provides a security group resource.

resource "aws_security_group" "vpc-sg-demo" {

	#name = ""
	#(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random, unique name
	
	#name_prefix = ""
	#(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name.
	
	#description = ""
	#(Optional, Forces new resource) The security group description. Defaults to "Managed by Terraform". Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.

	#vpc_id = ""
	#(Optional, Forces new resource) The VPC ID.
	
	#tags {}
	#(Optional) A mapping of tags to assign to the resource.
	
}

Attributes Reference
The following attributes are exported:

	id			- The ID of the security group
	vpc_id		- The VPC ID.
	owner_id	- The owner ID.
	name		- The name of the security group
	description	- The description of the security group
	ingress		- The ingress rules. See above for more.
	egress		- The egress rules. See above for more.
*/
