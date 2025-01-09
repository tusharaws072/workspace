

terraform {
  backend "s3" {
    bucket = "phoenix12345"                # Replace with your S3 bucket name
    key    = "terraform/statefile.tfstate" # Path within the bucket
    region = "ap-southeast-1"              # Replace with your region

    encrypt = true # Enable server-side encryption
  }
}