resource "aws_elasticsearch_domain" "es-cluster" {
  count = "${var.aws_elasticsearch_cluster_enabled}"
  
  domain_name           = "es-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  elasticsearch_version = "2.3"
  
  cluster_config {
    instance_type             = "t2.micro.elasticsearch"
    instance_count            = "3"
    dedicated_master_enabled  = "true"
    dedicated_master_type     = "t2.micro.elasticsearch"
    dedicated_master_count    = "3"
    zone_awareness_enabled    = "false"
  }
  
  ebs_options {
    ebs_enabled = "true"
    volume_type = "gp2"
    volume_size = "10"
	}
  
  snapshot_options {
    automated_snapshot_start_hour = 00
  }
  
  advanced_options {
    "rest.action.multi.allow_explicit_index" = true
  }
  
  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:eu-west-1:${data.aws_caller_identity.aws_account_id.account_id}:domain/es-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}/*"
    }
  ]
}
CONFIG

  tags {
    Domain        = "es-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "ElasticSearch"
    ResourceGroup = "AWS Services"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

###########################
##  HELP / Instructions  ##
###########################

/*
AWS_ELASTICSEARCH_DOMAIN
URL: https://www.terraform.io/docs/providers/aws/r/elasticsearch_domain.html

resource "aws_elasticsearch_domain" "es" {

	#domain_name = "elastica-demo"
	#(Required) Name of the domain.
	#The name must start with a lowercase letter and must be between 3 and 28 characters. Valid characters are a-z (lowercase only), 0-9, and - (hyphen).
	
	#elasticsearch_version = "1.5"
	#(Optional) The version of ElasticSearch to deploy. Only valid values are 1.5 and 2.3. Defaults to 1.5
	
	#advanced_options
	#(Optional) Key-value string pairs to specify advanced configuration options.
		advanced_options {
			"rest.action.multi.allow_explicit_index" = true
			#If you want to configure access to domain sub-resources, such as specific indices, you must set this property to "false". Setting this property to "false" prevents users from bypassing access control for sub-resources. The default value for this setting is "true".
			
			indices.fielddata.cache.size
			#Specifies the percentage of heap space that is allocated to fielddata. By default, this setting is unbounded.
		}
	
	#access_policies
	#(Optional) IAM policy document specifying the access policies for the domain
	access_policies = <<CONFIG
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "es:*",
			"Principal": "*",
			"Effect": "Allow",
			"Condition": {
				"IpAddress": {"aws:SourceIp": ["66.193.100.22/32"]}
			}
		}
	]
}
CONFIG

	#snapshot_options
	#(Optional) Snapshot related options
		snapshot_options {
			automated_snapshot_start_hour = 23
			#(Required) Hour during which the service takes an automated daily snapshot of the indices in the domain.
		}

	#ebs_options
	#(Optional) EBS related options
		ebs_options {
			ebs_enabled
			#(Required) Whether EBS volumes are attached to data nodes in the domain
			
			volume_type
			#(Optional) The type of EBS volumes attached to data nodes.
			
			volume_size
			#The size of EBS volumes attached to data nodes. Required if ebs_enabled is set to true.
			
			iops
			#(Optional) The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type.
		}

	#cluster_config
	#(Optional) Cluster configuration of the domain
		cluster_config {
			instance_type
			#(Optional) Instance type of data nodes in the cluster.
			
			instance_count
			#(Optional) Number of instances in the cluster.
			
			dedicated_master_enabled
			#(Optional) Indicates whether dedicated master nodes are enabled for the cluster.
			
			dedicated_master_type
			#(Optional) Instance type of the dedicated master nodes in the cluster.
			
			dedicated_master_count
			#(Optional) Number of dedicated master nodes in the cluster
			
			zone_awareness_enabled
			#(Optional) Indicates whether zone awareness is enabled.
		}

	#tags
	#(Optional) A mapping of tags to assign to the resource
		tags {
			Domain = "TestDomain"
		}
}

Attributes Reference
The following attributes are exported:

	arn			- Amazon Resource Name (ARN) of the domain.
	domain_id	- Unique identifier for the domain.
	endpoint	- Domain-specific endpoint used to submit index, search, and data upload requests.
*/