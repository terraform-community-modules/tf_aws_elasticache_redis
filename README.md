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
- `redis_version` - "Redis version to use, defaults to 3.2.4"

Usage
-----

```hcl
module "redis" {
  source = "../modules/terraform-redis-elasticache"
  env            = "${var.env}"
  name           = "thtest"
  redis_clusters = "2"
  redis_failover = "true"
  subnets        = "${module.vpc.database_subnets}"
  vpc_id         = "${module.vpc.vpc_id}"
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
