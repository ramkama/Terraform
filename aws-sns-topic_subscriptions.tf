#resource "aws_sns_topic_subscription" "prj-sns_topic_subscription-ec2_autoscalling_notification" {

	#topic_arn = "${aws_sns_topic.prj-sns_topic-ec2_autoscalling_notification.arn}"
	#(Required) The ARN of the SNS topic to subscribe to

	#protocol = ""
	#(Required) The protocol to use. The possible values for this are: sqs, lambda, application. (http or https are partially supported, see below) (email, sms, are options but unsupported, see below).
	#Supported SNS protocols:
	#	lambda -- delivery of JSON-encoded message to a lambda function
	#	sqs -- delivery of JSON-encoded message to an Amazon SQS queue
	#	application -- delivery of JSON-encoded message to an EndpointArn for a mobile app and device
	#
	#Partially supported SNS protocols:
	#	http -- delivery of JSON-encoded messages via HTTP. Supported only for the end points that auto confirms the subscription.
	#	https -- delivery of JSON-encoded messages via HTTPS. Supported only for the end points that auto confirms the subscription.

	#endpoint
	#(Required) The endpoint to send data to, the contents will vary with the protocol. (see below for more information)

	#endpoint_auto_confirms
	#(Optional) Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)

	#confirmation_timeout_in_minutes
	#(Optional) Integer indicating number of minutes to wait in retying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols (default is 1 minute).

	#raw_message_delivery
	#(Optional) Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property).

#}