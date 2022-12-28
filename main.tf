provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  cidr            = var.cidr
  az             = var.az
  //private_subnet = var.private_subnet
  public_subnet  = var.public_subnet
}
module "ec2" {
  source = "./modules/ec2"
  //private_subnet_id    = module.vpc.private_subnet_id
  public_subnet_id     = module.vpc.public_subnet_id
  allowed_ports        = var.allowed_ports
  //api_ports            = var.api_ports
  key_name             = var.key_name 
  az                   = var.az
  ami                  = var.ami
  vpc_id               = module.vpc.vpc_id
  instance_type        = var.instance_type
  depends_on           = [module.vpc]
}
