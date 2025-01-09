output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_cidr_blocks" {
    value = module.vpc.public_subnets_cidr_blocks
  
}

output "bastion_public_subnet" {
    value = module.vpc.public_subnets[0]
  
}