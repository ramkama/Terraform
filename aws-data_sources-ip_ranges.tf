/*
AWS_IP_RANGES
Use this data source to get the IP ranges of various AWS products and services.

## Arguments Reference ##
The following arguments are supported:

	data "aws_ip_ranges" "european_ec2" {
		regions = []
		#(Optional) Filter IP ranges by regions (or include all regions, if omitted). Valid items are global (for cloudfront) as well as all AWS regions (e.g. eu-central-1)
		
		services = []
		#(Required) Filter IP ranges by services. Valid items are amazon (for amazon.com), cloudfront, ec2, route53 and route53_healthchecks.
	}

## Attributes Reference ##
The following attributes are exported:

	cidr_blocks	- The lexically ordered list of CIDR blocks.
	create_date	- The publication time of the IP ranges (e.g. 2016-08-03-23-46-05).
	sync_token	- The publication time of the IP ranges, in Unix epoch time format (e.g. 1470267965).
	
*/
