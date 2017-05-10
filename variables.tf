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
  default     = "false"
}

variable "allowed_cidr" {
  type        = "list"
  default     = ["127.0.0.1/32"]
  description = "A list of Security Group ID's to allow access to."
}

variable "allowed_security_groups" {
  type        = "list"
  default     = []
  description = "A list of Security Group ID's to allow access to."
}

variable "env" {
  description = "env to deploy into, should typically dev/staging/prod"
}

variable "name" {
  description = "Name for the Redis replication group i.e. UserObject"
}
variable "redis_clusters" {
  description = "Number of Redis cache clusters (nodes) to create"
}

variable "redis_failover" {
  default = false
}

variable "redis_node_type" {
  description = "Instance type to use for creating the Redis cache clusters"
  default     = "cache.m3.medium"
}

variable "redis_port" { default = 6379 }

variable "subnets" {
  type        = "list"
  description = "List of VPC Subnet IDs for the cache subnet group"
}

# might want a map
variable "redis_version" {
  description = "Redis version to use, defaults to 3.2.4"
  default = "3.2.4"
}

variable "vpc_id" {
  description = "VPC ID"
}
