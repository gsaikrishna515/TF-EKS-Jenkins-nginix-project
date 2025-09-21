provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  aws_region   = var.aws_region
  project_name = var.project_name
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id # Get VPC ID from the network module
  my_ip        = [var.my_ip]           # Pass your IP to the security module
}

module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  instance_type     = var.instance_type
  ssh_key_name      = var.ssh_key_name
  subnet_id         = module.network.subnet_id     # Get Subnet ID from the network module
  security_group_id = [module.security.security_group_id] # Get SG ID from the security module
}


