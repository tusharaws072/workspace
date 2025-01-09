
# Origin Access Control (OAC) Configuration
resource "aws_cloudfront_origin_access_control" "oac" {
  for_each = {  for bucket in var.s3_bucket_names : bucket => bucket}

  name        = "oac-for-${each.key}"
  description = "Origin access control for bucket ${each.value}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# CloudFront Distributions
resource "aws_cloudfront_distribution" "cf_dist" {
  for_each = { for bucket in var.s3_bucket_names: bucket => bucket }

  enabled             = true
  default_root_object = "index.html"

  origin {
    
    domain_name = "${each.key}.s3.amazonaws.com"
    origin_id   = "S3-${each.key}"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac[each.key].id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id =  "S3-${each.key}"
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name        = var.project_name
    Environment = var.stage_name
  }

}
