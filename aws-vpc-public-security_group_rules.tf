resource "aws_security_group_rule" "vpc-pub-ec2-elb-ingress-port-80" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-ec2-elb.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "80"
  to_port     = "80"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-pub-ec2-elb-egress-port-80" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id	= "${aws_security_group.vpc-pub-ec2-elb.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "0"
  to_port     = "65535"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-pub-ec2-inst-ingress-elb-port-80" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "80"
  to_port     = "80"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-elb.id}"
}

resource "aws_security_group_rule" "vpc-pub-ec2-inst-egress-port-80" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "0"
  to_port     = "65535"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-pub-elcache-memc-ingress-port-11211" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-elcache-memcached.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "11211"
  to_port     = "11211"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-elcache-memc-egress-port-11211" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-elcache-memcached.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "11211"
  to_port     = "11211"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-elcache-redis-ingress-port-6379" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-elcache-redis.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "6379"
  to_port     = "6379"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-elcache-redis-egress-port-6379" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-elcache-redis.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "6379"
  to_port     = "6379"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-efs-mnt-ingress-port-2049" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-efs-mounts.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "2049"
  to_port     = "2049"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-efs-mnt-egress-port-2049" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-efs-mounts.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "2049"
  to_port     = "2049"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-rds-inst-ingress-port-3306" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-rds-instances.id}"
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "3306"
  to_port     = "3306"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}

resource "aws_security_group_rule" "vpc-pub-rds-inst-egress-port-3306" {
  count = "${var.aws_vpc_pub_enabled}"
  security_group_id = "${aws_security_group.vpc-pub-rds-instances.id}"
  type        = "egress"
  protocol    = "tcp"
  from_port   = "3306"
  to_port     = "3306"
  source_security_group_id = "${aws_security_group.vpc-pub-ec2-inst.id}"
}
