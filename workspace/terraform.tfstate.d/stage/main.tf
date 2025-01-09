# s3_bucket.tf

resource "aws_s3_bucket" "terraform_state" {
  bucket = "phoenix12345"               # Replace with your S3 bucket name create s3 through console 
  acl    = "private"
}
