
module "dev1_network" {
  source       = "./modules/network"
  network_name = "dev1"
  vpc_cidr     = "10.1.0.0/16"
  # Save money: disable while no EC2s are deployed
  internet_gateway = 0
  nat_gateway = 0
}

module "dev2_network" {
  source       = "./modules/network"
  network_name = "dev2"
  vpc_cidr     = "10.2.0.0/16"
  # Save money: disable while no EC2s are deployed
  internet_gateway = 0
  nat_gateway = 0
}

module "infra_network" {
  source       = "./modules/network"
  network_name = "infra"
  vpc_cidr     = "10.3.0.0/16"
}
