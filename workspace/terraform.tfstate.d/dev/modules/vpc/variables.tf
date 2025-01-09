variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "nat_destination_cidr_block" {
  description = "CIDR block for NAT destination routing"
  type        = string
}

variable "stage_name" {
  description = "Deployment stage (dev, prod, etc.)"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "nat_eip_allocation_id" {
  description = "Elastic IP allocation ID for NAT Gateway"
  type        = string
}
