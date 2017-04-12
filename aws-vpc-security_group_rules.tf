/*
AWS_SECURITY_GROUP_RULE
Provides a security group rule resource. Represents a single ingress or egress group rule, which can be added to external Security Groups.

resource "aws_security_group_rule" "vpc-sgr-demo" {

	#security_group_id = "${aws_security_group.vpc-sg-demo.id}"
	#security_group_id - (Required) The security group to apply this rule to.

	#type = ""
	#(Required) The type of rule being created. Valid options are ingress (inbound) or egress (outbound).

	#protocol = "tcp"
	#(Required) The protocol.
	
	#cidr_blocks = ["0.0.0.0/0"]
	#(Optional) List of CIDR blocks. Cannot be specified with source_security_group_id.

	#source_security_group_id = ""
	#(Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks.
	
	#from_port = 0
	#(Required) The start port (or ICMP type number if protocol is "icmp").
	
	#to_port = 65535
	#(Required) The end range port (or ICMP code if protocol is "icmp").

	#prefix_list_ids = ["pl-12c4e678"]
	#(Optional) List of prefix list IDs (for allowing access to VPC endpoints). Only valid with egress.
	
	#self = ""
	#(Optional) If true, the security group itself will be added as a source to this ingress rule.	
	
}

Attributes Reference
The following attributes are exported:

	id			- The ID of the security group rule
	type		- The type of rule, ingress or egress
	from_port	- The source port
	to_port		- The destination port
	protocol	– The protocol used
*/
