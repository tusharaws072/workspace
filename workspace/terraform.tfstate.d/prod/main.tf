# # s3_bucket.tf

# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "your-s3-bucket-name"   # Replace with your S3 bucket name
#   acl    = "private"
# }


# # dynamodb_table.tf

# resource "aws_dynamodb_table" "terraform_locks" {
#   name           = "your-dynamodb-table-name"  # Replace with your table name
#   hash_key       = "LockID"
#   billing_mode   = "PAY_PER_REQUEST"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }



module "vpc" {
  source                     = "./modules/vpc"
  region                     = var.region
  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  nat_destination_cidr_block = var.nat_destination_cidr_block
  stage_name                 = var.stage_name
}