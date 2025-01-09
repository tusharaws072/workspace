# # backend.tf

# terraform {
#   backend "s3" {
#     bucket         = "your-s3-bucket-name"         # Replace with your S3 bucket name
#     key            = "terraform/statefile.tfstate" # Path within the bucket
#     region         = "us-west-2"                   # Replace with your region
#     dynamodb_table = "your-dynamodb-table-name"    # Optional: for state locking
#     encrypt        = true                          # Enable server-side encryption
#   }
# }
