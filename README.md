# IaC (Infrastructure as Code)

## Terraform | AWS | Full-Stack Templating

### Pre-Configure via CLi
<dl>
  <dt>> Configure Remote State</dt>
  <dd>`terraform remote config -backend=Atlas -backend-config="name=$[atlas_username]/$[atlas_environment_name]" -backend-config="access_token=$[atlas_access_tocken]"`</dd>

  <dt>> Push Configuration to Atlas</dt>
  <dd>`terraform push -name="$[atlas_username]/$[atlas_environment_name]" -token="$[atlas_access_tocken]" -var-file=$[*.tfvars] -var 'aws_access_key=AAABBBCCC..' -var 'aws_secret_key=00112233..'`</dd>
</dl>


### Terraform Data Sources:

+ data.aws_ami.centos_ami
+ data.aws_caller_identity.master
+ data.aws_elb_service_account.master

+ template_file.ec2_instance-userdata

### AWS Resources Map:

+ Compute
  + EC2
    + Instances
      + aws_instance.ec2_instance
    + Images
    + EBS | Elastic Block Store
    + Network & Security
      + aws_key_pair.prj-ec2_key_pair
    + ELB | Elastic Load Balancing
      + aws_elb.ec2-elb
    + AS | Auto Scaling
      + aws_launch_configuration.prj-ec2_launch_conf
      + aws_autoscaling_group.prj-ec2_autoscalling_group
      + aws_autoscaling_notification.prj-ec2_autoscalling_notification
    + SSM | Simple Systems Manager

+ Storage & Content Delivery
  + S3
    + aws_s3_bucket.prj-s3_bucket-elb_logs
    + aws_s3_bucket_policy.prj-s3_bucket_policy-elb_logs
  + EFS (Elastic File System)
    + aws_efs_file_system.volume
    + aws_efs_mount_target.az-eu-west-1a
    + aws_efs_mount_target.az-eu-west-1b
    + aws_efs_mount_target.az-eu-west-1c

+ Database
  + RDS | Relational Database Service
    + Maria DB
      + aws_db_instance.mariadb
  + ELC | ElastiCache
    + MemCached
      + aws_elasticache_cluster.memcached
    + Redis
      + aws_elasticache_cluster.redis

+ Networking
  + VPC | Virtual Pricate Cloud
    + VPC
    + Security
      + Network ACLs
      + Security Groups
        + Groups
          + aws_security_group.ec2-elb
          + aws_security_group.ec2-inst
          + aws_security_group.efs-mounts
          + aws_security_group.elcache-memcached
          + aws_security_group.elcache-redis
          + aws_security_group.rds-instances
        + Rules
          + aws_security_group_rule.ec2-elb-egress-port-80
          + aws_security_group_rule.ec2-elb-ingress-port-80
          + aws_security_group_rule.ec2-inst-egress-elb-port-80
          + aws_security_group_rule.ec2-inst-ingress-elb-port-80
          + aws_security_group_rule.efs-mnt-egress-port-2049
          + aws_security_group_rule.efs-mnt-ingress-port-2049
          + aws_security_group_rule.elcache-memc-egress-port-11211
          + aws_security_group_rule.elcache-memc-ingress-port-11211
          + aws_security_group_rule.elcache-redis-egress-port-6379
          + aws_security_group_rule.elcache-redis-ingress-port-6379
          + aws_security_group_rule.rds-inst-egress-port-3306
          + aws_security_group_rule.rds-inst-ingress-port-3306
    + VPN Connections
  + R53 | Route 53

+ Developer Tools

+ Management Tools

+ Security & Identity
  + IAM | Identity & Access Management
    + aws_iam_user.prj-iam_user
    + aws_iam_user_policy.prj-iam_cuplc
    + aws_iam_access_key.prj-iam_accesskey

+ Analytics
  + ElasticSearch Service
    + aws_elasticsearch_domain.es-cluster

+ Mobile Services
  + SNS | Simple Notification Service
    + aws_sns_topic.prj-sns_topic-ec2_autoscalling_notification

+ Application Services


