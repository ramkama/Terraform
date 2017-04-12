data "aws_caller_identity" "aws_account_id" { }

output "aws_account_id" {
	value = "${data.aws_caller_identity.aws_account_id.account_id}"
}

/*
AWS_CALLER_IDENTITY
Use this data source to get the access to the effective Account ID in which Terraform is working.

##	NOTE on aws_caller_identity:
##	an Account ID is only available if skip_requesting_account_id is not set on the AWS provider. In such cases, the data source will return an error.

## Argument Reference ##
There are no arguments available for this data source.

	data "aws_caller_identity" "current" { }

## Attributes Reference ##
The following attributes are exported:

	account_id	- is set to the ID of the AWS account.

	output "aws_account_id" {
		value = "${data.aws_caller_identity.current.account_id}"
	}
*/
