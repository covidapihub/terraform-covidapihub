variable "allowed_cidrs" {
  description = "A list of CIDR block ranges allowed to access this redis cluster"
  type        = list(string)
}

variable "engine_version" {
  default = "3.2.10"
}

variable "name" {
  description = "Name of elasticache cluster and related resources"
}

variable "node_type" {
  # https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html
  description = "Instance size for redis"
  default     = "cache.t2.small"
}

variable "num_nodes" {
  description = "The number of redis nodes; minimum 1"
  default     = 1
}

variable "port" {
  default = 6379
  type    = number
}

variable "subnet_ids" {
  description = "Array of subnet ids; provide at least 1"
  type        = list(string)
}

