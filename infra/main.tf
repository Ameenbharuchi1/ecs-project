module "vpc" {
  source = "./modules/vpc"
  public_subnet_name = "public-subnet-2"
  sg_name = "sg-ecs"
  igw_name = "ecs-igw"
  vpc_name = "ecs-vpc"
  private_subnet_name = "private-subnet"
  route_table_name = "public-route-table"
}

module "alb" {
  source = "./modules/alb"
  tg_name = "ecs-target"
  load_balancer_type = "application"
  elb-name = "ecs-elb"
  certificate_arn = "arn:aws:acm:eu-west-2:084375562247:certificate/aa791c38-9818-4b37-bd2d-49268a2e2a6e"
  public_subnetb_id = module.vpc.public_subnet_b_id
  public_subnet_id = module.vpc.public_subnet_a_id
  sg_id = module.vpc.security_group_id
  vpc_id = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"
  ecs-fargate-name = "fargate"
  task-def-cpu = 1024
  ecs-cluster-name = "doorfeed-cluster"
  capacity_providers = ["FARGATE"]
  private_subnet_id = module.vpc.private_subnet_a_id
  private_subnetb_id = module.vpc.private_subnet_b_id
  sg_id = module.vpc.security_group_id
  target_group_arn = module.alb.target_group_arn
}

module "route-53" {
  source = "./modules/route-53"
  subdomain_name = "tm.doorfeed.ameenbharuchi2.com"
  hosted_zone = "doorfeed.ameenbharuchi2.com"
  dns_name = module.alb.alb_dns_name
}
