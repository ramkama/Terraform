resource "aws_db_instance" "mariadb" {
  count = "${var.aws_rds_cluster_mariadb_enabled}"
  
  identifier  = "rds-mariadb-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  
  engine          = "mariadb"
  engine_version  = "10.0.24"
  
  instance_class    = "db.t2.micro"
  storage_type      = "gp2"
  allocated_storage = "10"
  
  port                    = 3306
  multi_az                = "false"
  availability_zone       = "eu-west-1a"
  publicly_accessible     = "true"
  db_subnet_group_name    = "${aws_db_subnet_group.services.id}"
  vpc_security_group_ids  = ["${aws_security_group.vpc-prv-rds-instances.id}"]
  
  name      = "${var.project_db_name}"
  username  = "${var.project_db_admin_username}"
  password  = "${var.project_db_admin_password}"
  
  #monitoring_role_arn  = ""
  monitoring_interval   = "0"
  
  apply_immediately = "true"
  
  maintenance_window          = "Sun:03:30-Sun:06:00"
  auto_minor_version_upgrade  = "true"
  allow_major_version_upgrade = "false"
  
  backup_window           = "00:30-03:00"
  backup_retention_period = "7"
  
  tags {
    Name          = "RDS-MariaDB-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "MariaDB"
    ResourceGroup = "RDS"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

/*
AWS_DB_INSTANCE
Provides an RDS instance resource. A DB instance is an isolated database environment in the cloud. A DB instance can contain multiple user-created databases.

resource "aws_db_instance" "default" {

	identifier
	#(Optional) The name of the RDS instance, if omitted, Terraform will assign a random, unique name

	snapshot_identifier
	#(Optional) Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05.	
	
	replicate_source_db
	#(Optional) Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. See DB Instance Replication and Working with PostgreSQL and MySQL Read Replicas for more information on using Replication.	
	
	engine
	#(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use.

	engine_version
	#(Optional) The engine version to use.

	license_model
	#(Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance.
	
	option_group_name
	#(Optional) Name of the DB option group to associate.
	
	parameter_group_name
	#(Optional) Name of the DB parameter group to associate.

	
	instance_class
	#(Required) The instance type of the RDS instance.

	storage_type
	#(Optional) One of "standard" (magnetic), "gp2" (general purpose SSD), or "io1" (provisioned IOPS SSD). The default is "io1" if iops is specified, "standard" if not.

	iops
	#(Optional) The amount of provisioned IOPS. Setting this implies a storage_type of "io1".
	
	allocated_storage
	#(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gigabytes.
	
	storage_encrypted
	#(Optional) Specifies whether the DB instance is encrypted. The default is false if not specified.

	
	name
	#(Optional) The DB name to create. If omitted, no database is created initially.

	username
	#(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user.
	
	password
	#(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.


	monitoring_role_arn
	#(Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances.

	monitoring_interval
	#(Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60.


	apply_immediately
	#(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information.

	maintenance_window
	#(Optional) The window to perform maintenance in. Syntax: "ddd:hh24:mi-ddd:hh24:mi". Eg: "Mon:00:00-Mon:03:00". See RDS Maintenance Window docs for more.
	
	auto_minor_version_upgrade
	#(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true.

	allow_major_version_upgrade
	#(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible.

	backup_window
	#(Optional) The backup window.

	backup_retention_period
	#(Optional) The days to retain backups for. Must be 1 or greater to be a source for a Read Replica.

	skip_final_snapshot
	#(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is true.

	copy_tags_to_snapshot
	#(Optional, boolean) On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified). Default false

	final_snapshot_identifier
	#(Optional) The name of your final DB snapshot when this DB instance is deleted. If omitted, no final snapshot will be made.

	

	port
	#(Optional) The port on which the DB accepts connections.

	multi_az
	#(Optional) Specifies if the RDS instance is multi-AZ

	availability_zone
	#(Optional) The AZ for the RDS instance.
	
	publicly_accessible
	#(Optional) Bool to control if instance is publicly accessible. Defaults to false.

	vpc_security_group_ids
	#(Optional) List of VPC security groups to associate.

	security_group_names
	#(Optional/Deprecated) List of DB Security Groups to associate. Only used for DB Instances on the EC2-Classic Platform.

	db_subnet_group_name
	#(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.



	kms_key_id
	#(Optional) The ARN for the KMS encryption key.

	character_set_name
	#(Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. Oracle Character Sets Supported in Amazon RDS

	
	tags
	#(Optional) A mapping of tags to assign to the resource.

}

Attributes Reference
The following attributes are exported:

	id						- The RDS instance ID.
	address					- The address of the RDS instance.
	arn						- The ARN of the RDS instance.
	allocated_storage		- The amount of allocated storage
	availability_zone		- The availability zone of the instance
	backup_retention_period	- The backup retention period
	backup_window			- The backup window
	endpoint				- The connection endpoint
	engine					- The database engine
	engine_version			- The database engine version
	instance_class			- The RDS instance class
	maintenance_window		- The instance maintenance window
	multi_az				- If the RDS instance is multi AZ enabled
	name					- The database name
	port					- The database port
	status					- The RDS instance status
	username				- The master username for the database
	storage_encrypted		- Specifies whether the DB instance is encrypted
	
**On Oracle instances the following is exported additionally:
	character_set_name		- The character set used on Oracle instances.
*/
