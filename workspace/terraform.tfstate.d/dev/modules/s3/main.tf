resource "aws_s3_bucket" "buckets" {
  for_each = { for bucket in var.buckets : bucket.name => bucket }

  bucket = "${each.value.bucket_name}"

    dynamic "website" {
    for_each = each.value.is_static ? [1] : []
    content {
      index_document = "index.html"
      error_document = "error.html"
    }
  }
  tags = {
    Name        = var.project_name
    Environment = var.stage_name
    Type        = each.value.is_static ? "true" : "Object Storage"
    is_static = each.value.is_static
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  for_each = { for bucket in var.buckets : bucket.name => bucket }

  statement {
    effect = "Allow"

    actions = ["s3:GetObject"]

    resources = [
      "arn:aws:s3:::${each.key}/*"
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

  }
}