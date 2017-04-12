data "aws_availability_zones" "aws_account_az" {}

output "aws_account_az" {
	value = ["${data.aws_availability_zones.aws_account_az.names}"]
}

/*
AWS_AVAILABILITY_ZONES
The Availability Zones data source allows access to the list of AWS Availability Zones which can be accessed by an AWS account within the region configured in the provider.

## Arguments Reference ##
The following arguments are supported:

	data "aws_availability_zones" "available" {
	
		state
		#(Optional) Allows to filter list of Availability Zones based on their current state.
		#Can be either:
		#	"available"
		#	"information"
		#	"impaired"
		#	"unavailable"
		#By default the list includes a complete set of Availability Zones to which the underlying AWS account has access, regardless of their state.
	
	}

## Attributes Reference ##
The following attributes are exported:

	names	- A list of the Availability Zone names available to the account.
*/
