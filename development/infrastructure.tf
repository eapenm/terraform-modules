module "dev_vpc_1" {
  source             = "../modules/network"
  vpc_name           = "dev_vpc_1"
  vpc_cidr           = "10.0.0.0/16"
  environment        = "development"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_cidr_block = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  natgw_id           = module.dev_natgw_1.natgw_id
}

module "dev_natgw_1" {
  source           = "../modules/nat"
  public_subnet_id = module.dev_vpc_1.public_subnets_id_1
  vpc_name         = module.dev_vpc_1.vpc_name
}