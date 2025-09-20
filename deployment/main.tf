# Create VPC and subnets from module
module "vpc" {
  source = "../vpc_network"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  vpc_cidr = var.vpc_cidr
  additional_tags = var.additional_tags
}

module "subnet_pair" {
  source = "../vpc_subnet"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  vpc_id = module.vpc.vpc_id
  subnet_cidrs = var.subnet_cidrs
  subnet_azs = var.subnet_azs
  igw_id = module.vpc.igw_id
  additional_tags = var.additional_tags
}

module "ec2_security" {
  source = "../ec2_security"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  vpc_id = module.vpc.vpc_id
  additional_tags = var.additional_tags
}

module "rds_security" {
  source = "../rds_security"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  vpc_id = module.vpc.vpc_id
  additional_tags = var.additional_tags
  source_security_group_id = module.ec2_security.ec2_sg_id
}

module "rds_instance" {
  source = "../rds_instance"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  subnet_ids = [module.subnet_pair.private_subnet_id, module.subnet_pair.public_subnet_id]
  security_groups = [module.rds_security.rds_sg_id]
  additional_tags = var.additional_tags
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "ec2_instance" {
  source = "../ec2_instance"
  region = var.region
  app_name = var.app_name
  env_name = var.env_name
  subnet_id = module.subnet_pair.public_subnet_id
  security_groups = [module.ec2_security.ec2_sg_id]
  additional_tags = var.additional_tags
  ssh_key_name = var.ssh_key_name
  user_data_script = templatefile("${var.user_data_template}", 
  {
    db_name = "${var.db_name}",
    db_username = "${var.db_username}",
    db_password = replace(var.db_password, "$", "\\$"),
    db_endpoint = "${module.rds_instance.rds_instance_endpoint}",
  })
}
