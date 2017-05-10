output "redis_security_group_id" {
  value = "${aws_security_group.redis_security_group.id}"
}

output "parameter_group" {
  value = "${aws_elasticache_parameter_group.redis_parameter_group.id}"
}

output "redis_subnet_group_name" {
  value = "${aws_elasticache_subnet_group.redis_subnet_group.name}"
}

output "redis_subnet_group_ids" {
  value = "${aws_elasticache_subnet_group.redis_subnet_group.subnet_ids}"
}

output "id" {
  value = "${aws_elasticache_replication_group.redis.id}"
}

output "port" {
  value = "${var.redis_port}"
}

output "endpoint" {
  value = "${aws_elasticache_replication_group.redis.primary_endpoint_address}"
}
output "configuration_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis.configuration_endpoint_address}"
}
