A Terraform module to create a Redis ElastiCache cluster.
===========

A terraform module providing a Redis ElastiCache cluster in AWS.

This module

- Creates Redis ElastiCache clusters
- Creates, manages, and exports a security group

----------------------
#### Required
- `env" - "env to deploy into, should typically dev/staging/prod"
- `name` - "Name for the Redis replication group i.e. UserObject"
- `redis_clusters` - "Number of Redis cache clusters (nodes) to create"
- `subnets` - "List of VPC Subnet IDs for the cache subnet group"
- `vpc_id"  - "VPC ID"


#### Optional

- `apply_immediately` - "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
- `allowed_cidr` - "A list of Security Group ID's to allow access to. Defaults to localhost"
- `allowed_security_groups` - "A list of Security Group ID's to allow access to. Defaults to empty list"
- `redis_failover` - "Defaults to false , for failover to work, node type must larger then t2, and redis_cluster must be greater then 1"
- `redis_node_type` - "Instance type to use for creating the Redis cache clusters Defaults to cache.m3.medium"
- `redis_port` - "Defaults to 6379"
- `redis_version` - "Redis version to use, defaults to 3.2.10"
- `redis_parameters` - "The additional parameters modifyed in parameter group"
- `redis_maintenance_window` - "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
- `redis_snapshot_window` - "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period"
- `redis_snapshot_retention_limit` - "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"

Usage
-----

```hcl
module "redis" {
  source         = "github.com/terraform-community-modules/tf_aws_elasticache_redis?ref=v1.3.0"
  env            = "${var.env}"
  name           = "thtest"
  redis_clusters = "2"
  redis_failover = "true"
  subnets        = "${module.vpc.database_subnets}"
  vpc_id         = "${module.vpc.vpc_id}"
}
```

Usage with redis_parameters
-----

```hcl
variable "redis_parameters" {
  description = "additional parameters"
  default = [{
    name  = "min-slaves-max-lag"
    value = "5"
  },{
    name  = "min-slaves-to-write"
    value = "1"
  },{
    name  = "databases"
    value = "32"
  }]
}

module "redis" {
  source           = "github.com/terraform-community-modules/tf_aws_elasticache_redis?ref=v1.3.0"
  ...
  redis_parameters = "${var.redis_parameters}"
  ...
}
```

Outputs
=======

- `redis_security_group_id`
- `parameter_group`
- `redis_subnet_group_name`
- `redis_subnet_group_ids`
- `id`
- `port`
- `endpoint`
- `configuration_endpoint_address`


Authors
=======

[Tim Hartmann](https://github.com/tfhartmann)

License
=======

[MIT License](LICENSE)
