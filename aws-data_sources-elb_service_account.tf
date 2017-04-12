data "aws_elb_service_account" "aws_elb_account_id" {}

/*
AWS_ELB_SERVICE_ACCOUNT
Use this data source to get the Account ID of the AWS Elastic Load Balancing Service Account in a given region for the purpose of whitelisting in S3 bucket policy.

## Arguments Reference ##
The following arguments are supported:

	data "aws_elb_service_account" "main" {
	
		region
		#(Optional) Name of the region whose AWS ELB account ID is desired. Defaults to the region from the AWS provider configuration.
	
	}

## Attributes Reference ##
The following attributes are exported:

	id	- The ID of the AWS ELB service account in the selected region.
	arn	- The ARN of the AWS ELB service account in the selected region.
	
*/