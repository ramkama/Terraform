/*
AWS_ECS_CONTAINER_DEFINITION
The ECS container definition data source allows access to details of a specific container within an AWS ECS service.

## Arguments Reference ##
The following arguments are supported:

	data "aws_ecs_container_definition" "ecs-mongo" {
		task_definition = "${aws_ecs_task_definition.mongo.id}"
		#(Required) The ARN of the task definition which contains the container
		
		container_name = "mongodb"
		#(Required) The name of the container definition
	}

## Attributes Reference ##
The following attributes are exported:

	image			- The docker image in use, including the digest
	image_digest	- The digest of the docker image in use
	cpu					- The CPU limit for this container definition
	memory				- The memory limit for this container definition
	memory_reservation	- The soft limit (in MiB) of memory to reserve for the container. When system memory is under contention, Docker attempts to keep the container memory to this soft limit
	environment			- The environment in use
	disable_networking	- Indicator if networking is disabled
	docker_labels		- Set docker labels

*/
