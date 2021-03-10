data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "random_id" "salt" {
  keepers = {
    redis_version = "${var.redis_version}"
  }
  byte_length = 8
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = format("%.20s", "${var.name}-${var.env}")
  replication_group_description = "Terraform-managed ElastiCache replication group for ${var.name}-${var.env}-${data.aws_vpc.vpc.tags["Name"]}"
  number_cache_clusters         = var.redis_clusters
  node_type                     = var.redis_node_type
  automatic_failover_enabled    = var.redis_failover
  multi_az_enabled              = var.multi_az_enabled
  engine_version                = var.redis_version
  port                          = var.redis_port
  parameter_group_name          = aws_elasticache_parameter_group.redis_parameter_group.id
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
  security_group_ids            = [aws_security_group.redis_security_group.id]
  apply_immediately             = var.apply_immediately
  maintenance_window            = var.redis_maintenance_window
  snapshot_window               = var.redis_snapshot_window
  snapshot_retention_limit      = var.redis_snapshot_retention_limit
  tags                          = merge(map("Name", format("tf-elasticache-%s-%s", var.name, lookup(data.aws_vpc.vpc.tags, "Name", ""))), var.tags)
}

resource "aws_elasticache_parameter_group" "redis_parameter_group" {
  name = replace(format("%.255s", lower(replace("tf-redis-${var.name}-${var.env}-${data.aws_vpc.vpc.tags["Name"]}-${random_id.salt.hex}", "_", "-"))), "/\\s/", "-")

  description = "Terraform-managed ElastiCache parameter group for ${var.name}-${var.env}-${data.aws_vpc.vpc.tags["Name"]}"

  # Strip the patch version from redis_version var
  family = "redis${replace(var.redis_version, "/\\.[\\d]+$/", "")}"
  dynamic "parameter" {
    for_each = var.redis_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = replace(format("%.255s", lower(replace("tf-redis-${var.name}-${var.env}-${data.aws_vpc.vpc.tags["Name"]}", "_", "-"))), "/\\s/", "-")
  subnet_ids = var.subnets
}
