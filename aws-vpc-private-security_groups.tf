resource "aws_security_group" "vpc-prv-ec2-elb" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-ec2-elb-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) Elastic LoadBalancer"
  tags {
    Name          = "VPC:PRV:SG-EC2:ELB-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "ELB"
    ResourceGroup = "EC2"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-ec2-inst" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-ec2-inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) EC2 Instances"
  
  tags {
    Name          = "VPC:PRV:SG-EC2:Inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "Instances"
    ResourceGroup = "EC2"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-elcache-memcached" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-elcache-memc-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) ElastiCache Memcached Cluster"
  
  tags {
    Name          = "VPC:PRV:SG-ElCache:MemC-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "MemCached"
    ResourceGroup = "ElastiCache"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-elcache-redis" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-elcache-redis-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) ElastiCache Redis Cluster"
  
  tags {
    Name          = "VPC:PRV:SG-ElCache:Redis-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "Redis"
    ResourceGroup = "ElastiCache"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-efs-mounts" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-efs-mnt-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) EFS Mount Targets"
  
  tags {
    Name          = "VPC:PRV:SG-EFS:mnt-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "Mount Targets"
    ResourceGroup = "EFS - Elastic File System"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-rds-instances" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-rds-inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  description = "Private VPC Security Group controlling access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) RDS DB Instances"
  
  tags {
    Name          = "VPC:PRV:SG-RDS:Inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    VPC-Type      = "Private"
    Resource      = "DB Instances"
    ResourceGroup = "RDS - Relational Database Service"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-ec2-inst-bal_offices_access" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-ec2-inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-office-acc"
  description = "Private VPC Security Group controlling Office Access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) EC2 Instances"
  
  tags {
    Name          = "VPC:PRV:SG-EC2:Inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-office-acc"
    VPC-Type      = "Private"
    Resource      = "Instances"
    ResourceGroup = "EC2"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_security_group" "vpc-prv-ec2-inst-remote_access" {
  count       = "${var.aws_vpc_prv_enabled}"
  vpc_id      = "${aws_vpc.private.id}"
  
  name        = "vpc-prv-sg-ec2-inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-rm-acc"
  description = "Private VPC Security Group controlling Remote Access to Project (${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}) EC2 Instances"
  
  tags {
    Name          = "VPC:PRV:SG-EC2:Inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-rm-acc"
    VPC-Type      = "Private"
    Resource      = "Instances"
    ResourceGroup = "EC2"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}
