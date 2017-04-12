resource "aws_elasticache_subnet_group" "redis" {
  count       = "${var.aws_elasticache_cluster_redis_enabled}"
  name        = "${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  subnet_ids  = ["${aws_subnet.private-services.id}"]
}
