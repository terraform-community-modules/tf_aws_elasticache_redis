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
  source  = "github.com/terraform-community-modules/tf_aws_elasticache_redis.git?ref=v2.2.0"

  env            = "dev"
  name           = "thtest"
  redis_clusters = "2"
  redis_failover = "true"
  subnets        = ["subnet-12345678", "subnet-11111111", "subnet-22222222"]
  vpc_id         = "vpc-12345678"

  redis_parameters = [{
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_cidr | A list CIDRs to allow access to. | `list(string)` | <pre>[<br>  "127.0.0.1/32"<br>]</pre> | no |
| allowed\_security\_groups | A list of Security Group ID's to allow access to. | `list(string)` | `[]` | no |
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest | `bool` | `false` | no |
| auth\_token | The password used to access a password protected server. Can be specified only if transit\_encryption\_enabled = true. If specified must contain from 16 to 128 alphanumeric characters or symbols | `string` | `null` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window | `bool` | `true` | no |
| availability\_zones | A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important | `list(string)` | `[]` | no |
| env | env to deploy into, should typically dev/staging/prod | `string` | n/a | yes |
| kms\_key\_id | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at\_rest\_encryption\_enabled = true | `string` | `""` | no |
| name | Name for the Redis replication group i.e. UserObject | `string` | n/a | yes |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic | `string` | `""` | no |
| redis\_clusters | Number of Redis cache clusters (nodes) to create | `string` | n/a | yes |
| redis\_failover | n/a | `bool` | `false` | no |
| redis\_maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period | `string` | `"fri:08:00-fri:09:00"` | no |
| redis\_node\_type | Instance type to use for creating the Redis cache clusters | `string` | `"cache.m3.medium"` | no |
| redis\_parameters | additional parameters modifyed in parameter group | `list(map(any))` | `[]` | no |
| redis\_port | n/a | `number` | `6379` | no |
| redis\_snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot\_retention\_limit is not supported on cache.t1.micro or cache.t2.\* cache nodes | `number` | `0` | no |
| redis\_snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period | `string` | `"06:30-07:30"` | no |
| redis\_version | Redis version to use, defaults to 3.2.10 | `string` | `"3.2.10"` | no |
| security\_group\_names | A list of cache security group names to associate with this replication group | `list(string)` | `[]` | no |
| snapshot\_arns | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my\_bucket/snapshot1.rdb | `list(string)` | `[]` | no |
| snapshot\_name | The name of a snapshot from which to restore data into the new node group. Changing the snapshot\_name forces a new resource | `string` | `""` | no |
| subnets | List of VPC Subnet IDs for the cache subnet group | `list(string)` | n/a | yes |
| tags | Tags for redis nodes | `map(string)` | `{}` | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. Requires 3.2.6 or >=4.0 redis\_version | `bool` | `false` | no |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | n/a |
| id | n/a |
| parameter\_group | n/a |
| port | n/a |
| redis\_security\_group\_id | n/a |
| redis\_subnet\_group\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Created by [Tim Hartmann](https://github.com/tfhartmann). Maintained by [Anton Babenko](https://github.com/antonbabenko) and [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_elasticache_redis/graphs/contributors).

## License

[MIT License](LICENSE)
