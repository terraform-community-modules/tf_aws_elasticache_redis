/*
# These vars would be used by cloudwatch.tf and should be uncommented if we decide to use them.
variable "alarm_cpu_threshold" {
  default = "75"
}

variable "alarm_memory_threshold" {
  # 10MB
  default = "10000000"
}

variable "alarm_actions" {
  type = "list"
}
*/

variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  type        = bool
  default     = false
}

variable "allowed_cidr" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
  default     = ["127.0.0.1/32"]
}

variable "allowed_security_groups" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
  default     = []
}

variable "env" {
  description = "env to deploy into, should typically dev/staging/prod"
  type        = string
}

variable "name" {
  description = "Name for the Redis replication group i.e. UserObject"
  type        = string
}

variable "redis_clusters" {
  description = "Number of Redis cache clusters (nodes) to create"
  type        = string
}

variable "multi_az_enabled" {
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
  type = bool
  default = false
}

variable "redis_failover" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
  type    = bool
  default = false
}

variable "is_migration_cluster" {
  description = "Specifies whether this is a cluster for replicating other EC2 redis. Useful for migrations."
  type = bool
  default = false
}

variable "redis_node_type" {
  description = "Instance type to use for creating the Redis cache clusters"
  type        = string
  default     = "cache.m3.medium"
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "subnets" {
  type        = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group"
}

# might want a map
variable "redis_version" {
  description = "Redis version to use, defaults to 3.2.10"
  type        = string
  default     = "3.2.10"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "redis_parameters" {
  description = "additional parameters modifyed in parameter group"
  type        = list(map(any))
  default     = []
}

variable "redis_maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
  type        = string
  default     = "fri:08:00-fri:09:00"
}

variable "redis_snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period"
  type        = string
  default     = "06:30-07:30"
}

variable "redis_snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
  type        = number
  default     = 0
}

variable "tags" {
  description = "Tags for redis nodes"
  type        = map(string)
  default     = {}
}
