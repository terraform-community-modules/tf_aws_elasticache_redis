# A Terraform module to create a Redis ElastiCache cluster

A terraform module providing a Redis ElastiCache cluster in AWS.

This module

- Creates Redis ElastiCache clusters
- Creates, manages, and exports a security group

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage

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

## Usage with redis_parameters

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allowed\_cidr | A list of Security Group ID's to allow access to. | list | `[ "127.0.0.1/32" ]` | no |
| allowed\_security\_groups | A list of Security Group ID's to allow access to. | list | `[]` | no |
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false. | string | `"false"` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest | string | `false` | no |
| auth\_token | The password used to access a password protected server. Can be specified only if transit_encryption_enabled = true. If specified must contain from 16 to 128 alphanumeric characters or symbols | string | `""` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window | string | `true` | no |
| availability\_zones | A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important | list | `<list>` | no |
| env | env to deploy into, should typically dev/staging/prod | string | n/a | yes |
| kms\_key\_id | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at_rest_encryption_enabled = true | string | `""` | no |
| name | Name for the Redis replication group i.e. UserObject | string | n/a | yes |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic | string | `""` | no |
| redis\_clusters | Number of Redis cache clusters (nodes) to create | string | n/a | yes |
| redis\_failover |  | string | `false` | no |
| redis\_maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period | string | `"fri:08:00-fri:09:00"` | no |
| redis\_node\_type | Instance type to use for creating the Redis cache clusters | string | `"cache.m3.medium"` | no |
| redis\_parameters | additional parameters modifyed in parameter group | list | `[]` | no |
| redis\_port |  | string | `"6379"` | no |
| redis\_snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes | string | `"0"` | no |
| redis\_snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period | string | `"06:30-07:30"` | no |
| redis\_version | Redis version to use, defaults to 3.2.10 | string | `"3.2.10"` | no |
| security\_group\_names | A list of cache security group names to associate with this replication group | list | `[]` | no |
| snapshot\_arns | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb | list | `[]` | no |
| snapshot\_name | The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource | string | `""` | no |
| subnets | List of VPC Subnet IDs for the cache subnet group | list | n/a | yes |
| tags | Tags for redis nodes | map | `{}` | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. Requires 3.2.6 or >=4.0 redis_version | string | `false` | no |
| vpc\_id | VPC ID | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint |  |
| id |  |
| parameter\_group |  |
| port |  |
| redis\_security\_group\_id |  |
| redis\_subnet\_group\_name |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Created by [Tim Hartmann](https://github.com/tfhartmann). Maintained by [Anton Babenko](https://github.com/antonbabenko) and [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_elasticache_redis/graphs/contributors).

## License

[MIT License](LICENSE)
