data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          =  "${var.env}-redis"
  number_cache_clusters         =  "${var.redis_num_cache_clusters}"
  node_type                     =  "${var.redis_node_type}"
  automatic_failover_enabled    =  "${var.redis_failover}"
  engine_version                =  "${var.redis_version}"
  port                          =  "${var.redis_port}"
  parameter_group_name          =  "${aws_elasticache_parameter_group.redis_parameter_group.id}"
  subnet_group_name             =  "${aws_elasticache_subnet_group.redis_subnet_group.id}"
  security_group_ids            = ["${aws_security_group.redis_security_group.id}"]
  apply_immediately             =  "${var.apply_immediately}"
  maintenance_window            =  "${var.redis_maintenance_window}"
  snapshot_window               =  "${var.redis_snapshot_window}"
  snapshot_retention_limit      =  "${var.redis_snapshot_retention_limit}"
}

resource "aws_elasticache_parameter_group" "redis_parameter_group" {
  name        = "${var.env}-redis-param-group"
  family      = "redis${replace(var.redis_version, "/\\.[\\d]+$/","")}"
  parameter   = "${var.redis_parameters}"
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name        =  "${var.env}-redis-subnet-group"
  subnet_ids  = ["${var.subnets}"]
}
