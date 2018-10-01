variable "env"                            {}
variable "vpc_id"                         {}
variable "subnets"                        { type = "list" }
variable "alarm_cpu_threshold"            { default = "75" }
variable "alarm_memory_threshold"         { default = "10000000" }
variable "alarm_actions"                  { type = "list" }
variable "apply_immediately"              { default = "false" }
variable "redis_num_cache_clusters"       { default = 1 }
variable "redis_failover"                 { default = false }
variable "redis_node_type"                { default = "cache.m3.medium" }
variable "redis_port"                     { default = 6379 }
variable "redis_version"                  { default = "3.2.10" }
variable "redis_maintenance_window"       { default = "fri:08:00-fri:09:00" }
variable "redis_snapshot_window"          { default = "06:30-07:30" }
variable "redis_snapshot_retention_limit" { default = 0 }
variable "redis_parameters" {
  type = "list"
  default     = []
}
variable "allowed_cidr" {
  type        = "list"
  default     = ["127.0.0.1/32"]
}
variable "allowed_security_groups" {
  type        = "list"
  default     = []
}
