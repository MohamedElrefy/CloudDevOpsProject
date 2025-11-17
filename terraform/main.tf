# Network Module
module "network" {
  source = "./modules/network"
  
  project         = var.project
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# EKS Module
module "eks" {
  source = "./modules/eks"
  
  cluster_name                        = var.cluster_name
  cluster_version                     = var.cluster_version
  vpc_id                              = module.network.vpc_id
  private_subnets                     = module.network.private_subnets
  node_instance_types                 = var.node_instance_types
  node_desired_size                   = var.node_desired_size
  node_min_size                       = var.node_min_size
  node_max_size                       = var.node_max_size
  node_disk_size                      = var.node_disk_size
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  cluster_log_types                   = var.cluster_log_types
}