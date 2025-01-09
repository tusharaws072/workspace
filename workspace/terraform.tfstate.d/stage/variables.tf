
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1" # Singapore region
}

variable "access_key" {
  description = "AWS access key for authentication."
  type        = string
  sensitive   = true
  default     = ""
}

variable "secret_key" {
  description = "AWS secret key for authentication."
  type        = string
  sensitive   = true
  default     = ""
}
