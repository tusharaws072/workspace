variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage_name" {
  description = "Deployment stage name"
  type        = string
}

variable "nat_destination_cidr_block" {
  description = "CIDR block for NAT Gateway routing"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
