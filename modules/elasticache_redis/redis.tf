
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "novelcovid-redis"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_nodes
  parameter_group_name = "default.redis3.2"
  engine_version       = var.engine_version
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids   = [aws_security_group.redis_sg.id]
}

resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "${var.name}-redis-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "redis_sg" {
  name = "${var.name}_elasticache_redis_sg"
  //  vpc_id      = aws_vpc.cluster.id

  ingress {
    description = "Allowed inbound"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}_elasticache_redis_sg"
  }
}
