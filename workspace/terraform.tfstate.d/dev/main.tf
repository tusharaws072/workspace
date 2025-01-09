######################  VPC ################

module "vpc" {
  source                     = "./modules/vpc"
  region                     = var.region
  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  nat_destination_cidr_block = var.nat_destination_cidr_block
  stage_name                 = var.stage_name
  availability_zones         = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  nat_eip_allocation_id      = aws_eip.nat.id
}
resource "aws_eip" "nat" {
  vpc = true
}

########### EC2 ################

module "ec2" {
  source              = "./modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnets[0]
  vpc_id              = module.vpc.vpc_id
  security_group_name = "root-ec2-sg"
  project_name        = var.project_name
  stage_name          = var.stage_name
  tags = {
    Name = "EC2-instance"
    Env  = var.environment
  }
}


# module "aws_s3" {
#   source       = "./modules/s3"
#   project_name = var.project_name
#   stage_name   = var.stage_name
#   buckets      = var.buckets
# }




# module "aws_cloudfront" {
#   source          = "./modules/cloudfront"
#   depends_on      = [module.aws_s3]
#   project_name    = var.project_name
#   stage_name      = var.stage_name
#   s3_bucket_names = module.aws_s3.s3_bucket_names
#   locations       = var.locations

# }



# RDS Module Configuration
module "rds" {
  source                 = "./modules/rds"
  db_instance_identifier = var.db_instance_identifier
  db_name                = var.db_name
  username               = var.username
  #password               = var.password
  db_instance_class   = var.db_instance_class
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  subnet_ids          = module.vpc.private_subnets # [module.vpc.private_subnets[0]] #   subnet_ids = module.vpc.private_subnets
  vpc_id              = module.vpc.vpc_id
  security_group_name = "rds-sg"
  project_name        = var.project_name
  stage_name          = var.stage_name
  tags = {
    Name = "EC2-instance"
    Env  = var.environment
  }
}



# module "cloudwatch" {
#   source     = "./modules/cloudwatch"
#   depends_on = [module.rds]
# }


# module "sns" {
#   source        = "./modules/sns"
#   db_identifier = var.db_identifier
#   #db_instance_identifier = var.db_instance_identifier 
#   sns_email = var.sns_email
# }
