output "azs" {
  value = aws_elasticache_cluster.redis.availability_zones
}

output "nodes" {
  value = aws_elasticache_cluster.redis.cache_nodes
}
