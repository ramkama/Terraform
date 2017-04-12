/*
AWS_IAM_POLICY_DOCUMENT
Generates an IAM policy document in JSON format.
This is a data source which can be used to construct a JSON representation of an IAM policy document, for use with resources which expect policy documents, such as the aws_iam_policy resource.

## Arguments Reference ##
The following arguments are supported:

	data "aws_iam_policy_document" "example" {
		policy_id
		#(Optional) - An ID for the policy document.
		
		statement {
			sid = "1"
			#(Optional) - An ID for the policy statement.
			
			effect
			#(Optional) Either "Allow" or "Deny", to specify whether this statement allows or denies the given actions. The default is "Allow".
			
			actions = []
			#(Optional) - A list of actions that this statement either allows or denies.
			
				actions = [
					"s3:ListAllMyBuckets",
					"s3:GetBucketLocation",
				]
			
			not_actions = []
			#(Optional) - A list of actions that this statement does not apply to. Used to apply a policy statement to all actions except those listed.
			
			resources = []
			#(Optional) - A list of resource ARNs that this statement applies to.
			
				resources = [
					"arn:aws:s3:::*",
				]
				
			not_resources= []
			#(Optional) - A list of resource ARNs that this statement does not apply to. Used to apply a policy statement to all resources except those listed.
			
			principals = {}
			#(Optional) - A nested configuration block (described below) specifying a resource (or resource pattern) to which this statement applies.
			
				principals = {
					type
					#(Required) The type of principal. For AWS accounts this is "AWS".
					
					identifiers
					#(Required) List of identifiers for principals. When type is "AWS", these are IAM user or role ARNs.
				}

			not_principals = {}
			#(Optional) - Like principals except gives resources that the statement does not apply to.

			condition = {}
			#(Optional) - A nested configuration block (described below) that defines a further, possibly-service-specific condition that constrains whether this statement applies.
			#When multiple condition blocks are provided, they must all evaluate to true for the policy statement to apply. (In other words, the conditions are combined with the "AND" boolean operation.)
			
			condition = {
				test
				#(Required) The name of the IAM condition type to evaluate.
				
				variable
				#(Required) The name of a Context Variable to apply the condition to. Context variables may either be standard AWS variables starting with aws:, or service-specific variables prefixed with the service name.
				
				values
				#(Required) The values to evaluate the condition against. If multiple values are provided, the condition matches if at least one of them applies. (That is, the tests are combined with the "OR" boolean operation.)
			}
		}
	}

## Attributes Reference ##
The following attribute is exported:

	json	- The above arguments serialized as a standard JSON policy document.
	
*/
