variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage_name" {
  description = "Deployment stage name"
  type        = string
}
variable "locations" {
  description = "List of locations"
  type        = list(string)
}
variable "s3_bucket_names" {
  type = list(string)
}

