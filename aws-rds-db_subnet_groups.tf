/*
resource "aws_db_subnet_group" "public-vpc" {
  count       = "${var.aws_vpc_pub_enabled}"
  name        = "db-subnetgrp-pub-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  subnet_ids  = ["${aws_subnet.public.*.id}"]
  
  tags {
    Name = "db-subnetgrp-pub-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  }
}
*/

resource "aws_db_subnet_group" "services" {
  count       = "${var.aws_rds_cluster_mariadb_enabled}"
  name        = "db-subnetgrp-srv-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  subnet_ids  = ["${aws_subnet.private-services.id}"]
  
  tags {
    Name = "db-subnetgrp-srv-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  }
}
