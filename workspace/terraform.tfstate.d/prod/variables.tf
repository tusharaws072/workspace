
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


#######################################################    VPC #######################


variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "jj-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_intra_subnet_cidrs" {
  description = "CIDR blocks for intra subnets"
  type        = list(string)
  default     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}

# variable "region" {
#   description = "AWS region"
#   type        = string
#   default     = "ap-southeast-1"
# }

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "lambda-api-infra"
}

variable "nat_destination_cidr_block" {
  description = "CIDR block for NAT Gateway routing"
  type        = string
  default     = "0.0.0.0/0"
}

variable "stage_name" {
  description = "Deployment stage name"
  type        = string
  default     = "test"
}
