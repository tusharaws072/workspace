output "s3_bucket_names" {
  description = "List of names of created S3 buckets"
  value       = [for bucket in aws_s3_bucket.buckets : bucket.bucket]
}

output "s3_buckets" {
  value = {
    for bucket in aws_s3_bucket.buckets : bucket.bucket => {
      id        = bucket.id
      is_static = bucket.tags["Type"] == "true"  # Adjust as per your tag or condition
    }
  }
}
