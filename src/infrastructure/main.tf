module "vpc_module" {
  source = "./modules/vpc"
}

module "subnet_module" {
  source   = "./modules/subnets"
  vpc_id   = module.vpc_module.vpc_id
  zone_one = var.zone_one
  zone_two = var.zone_two
}

module "internet_gateway_module" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc_module.vpc_id
}


module "nat_gateway_module" {
  source     = "./modules/nat-gateway"
  subnet_ids = module.subnet_module.subnet_ids
}

module "route_module" {
  source              = "./modules/route-table"
  subnet_ids          = module.subnet_module.subnet_ids
  nat_ids             = module.nat_gateway_module.nat_ids
  vpc_id              = module.vpc_module.vpc_id
  internet_gateway_id = module.internet_gateway_module.igw_id

}


module "security_group_module" {
  source = "./modules/security-groups"
  vpc_id = module.vpc_module.vpc_id
  my_ip  = var.my_ip
}

module "database_module" {
  source     = "./modules/database"
  subnet_ids = module.subnet_module.subnet_ids
  db_sg_id   = module.security_group_module.db_sg_id
}


module "efs_module" {
  source     = "./modules/efs"
  efs_sg_id  = module.security_group_module.efs_sg_id
  subnet_ids = module.subnet_module.subnet_ids
}

module "ec2_module" {
  source = "./modules/ec2"

  efs_sg_id        = module.security_group_module.efs_sg_id
  ssh_sg_id        = module.security_group_module.ssh_sg_id
  lb_sg_id         = module.security_group_module.lb_sg_id
  wb_sg_id         = module.security_group_module.wb_sg_id
  db_sg_id         = module.security_group_module.db_sg_id
  subnet_ids       = module.subnet_module.subnet_ids
  wordpress_tg_arn = module.alb_module.wordpress_tg_arn
  efs_dns_name     = module.efs_module.efs_dns_name
  db               = module.database_module.db

}


module "alb_module" {
  source          = "./modules/load-balancer"
  vpc_id          = module.vpc_module.vpc_id
  lb_sg_id        = module.security_group_module.lb_sg_id
  subnet_ids      = module.subnet_module.subnet_ids
  auto_scaling_id = module.ec2_module.auto_scaling_id
}

module "cloud_watch_module" {
  source            = "./modules/cloud-watch"
  auto_scaling_name = module.ec2_module.auto_scaling_name
}
