variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "stage_name" {
  description = "The stage name (e.g., dev, prod, staging)"
  type        = string
}

variable "db_instance_identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

# variable "password" {
#   description = "The password for the database"
#   type        = string
#   sensitive   = true
# }

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "The database engine (e.g., mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "The engine version"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "security_group_name" {
  description = "The security group name"
  type        = string
}

variable "tags" {
  description = "Tags for the RDS instance"
  type        = map(string)
}





variable "backup_retention_period" {
  description = "The number of days to retain backups for the RDS instance."
  type        = number
  default     = 7 # Adjust based on your retention policy
}

# variable "preferred_backup_window" {
#   description = "The daily time range during which backups are created."
#   type        = string
#   default     = "03:00-04:00" # Adjust to your preferred backup window
# }
