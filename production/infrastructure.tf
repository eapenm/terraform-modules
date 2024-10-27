module "prod_vpc_1" {
  source             = "../modules/network"
  vpc_name           = "prod_vpc_1"
  vpc_cidr           = "192.168.0.0/16"
  environment        = "production"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_cidr_block  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_cidr_block = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
  natgw_id           = module.prod_natgw_1.natgw_id
}
module "prod_natgw_1" {
  source           = "../modules/nat"
  public_subnet_id = module.prod_vpc_1.public_subnets_id_1
  vpc_name         = module.prod_vpc_1.vpc_name
}





