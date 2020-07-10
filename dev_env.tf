
module "dev1_network" {
  source       = "./modules/network"
  network_name = "dev1"
  vpc_cidr     = "10.1.0.0/16"
  # Save money: disable while no EC2s are deployed
  internet_gateway = 0
  nat_gateway      = 0
}

module "dev2_network" {
  source       = "./modules/network"
  network_name = "dev2"
  vpc_cidr     = "10.2.0.0/16"
  # Save money: disable while no EC2s are deployed
  internet_gateway = 0
  nat_gateway      = 0
}

module "infra_network" {
  source       = "./modules/network"
  network_name = "infra"
  vpc_cidr     = "10.3.0.0/16"
  # Disable NAT while we clean up other EIPs (NAT Gateways require an EIP)
  nat_gateway = 1
}

module "peer_infra_dev1" {
  source   = "./modules/peering_relationship"
  from_vpc = module.infra_network.vpc_id
  to_vpc   = module.dev1_network.vpc_id
}

# NOTE(cm): Test invocation of standalone elasticache_redis module
# Delete after peering connectivity test is over
module "redis_test" {
  source = "./modules/elasticache_redis"
  name = "infra-test"
  allowed_cidrs = [module.dev1_network.vpc_cidr, module.infra_network.vpc_cidr]
  subnet_ids = module.infra_network.private_subnet_ids
}
