
######################################          VPC      ####################################
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "aws-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "nat_destination_cidr_block" {
  description = "CIDR block for NAT destination routing"
  type        = string
  default     = "0.0.0.0/0"
}

variable "stage_name" {
  description = "Deployment stage (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "nat_eip_allocation_id" {
  description = "Elastic IP allocation ID for the NAT Gateway"
  type        = string
  default     = "eipalloc-1234567890abcdef" # Replace with a valid EIP allocation ID
}




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






################################################  EC2 ###################################

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-06650ca7ed78ff6fa"
}


variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment for the resources"
  type        = string
  default     = "dev"
}



variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "key_name"
}

variable "public_key" {
  description = "Public key for the EC2 key pair"
  type        = string
  default     = "public_key"
}



variable "secret_name" {
  description = "Name of the Secrets Manager secret to store the private key"
  type        = string
  default     = "secret_name "
}




######################################  S3  ##############
variable "buckets" {
  default = [
    {
      name        = "jj-admin-bucket"
      bucket_name = "jj-admin"
      oac_name    = "admin_oac"
      is_static   = "true"
    },
    {
      name        = "jj-user-bucket"
      bucket_name = "jj-user"
      oac_name    = "user_oac"
      is_static   = "true"
    },
    {
      name        = "jj-media-bucket"
      bucket_name = "jj-media"
      oac_name    = "media_oac"
      is_static   = "false"
    }
  ]
}




variable "locations" {
  description = "List of locations for CloudFront distribution"
  type        = list(string) # Adjust the type as needed
  default     = ["US", "EU"] # Provide a default value if applicable
}




#################################### RDS ###############


variable "db_instance_identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "example-rds-instance"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "exampledb"
}


variable "username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

# variable "password" {
#   description = "The password for the database"
#   type        = string
#   sensitive   = true
#   #default     = "password"
#   default = "rdsinstance"
# }

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}


variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "engine" {
  description = "The database engine (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}


variable "engine_version" {
  description = "The engine version"
  type        = string
  default     = "8.0"
}





variable "db_identifier" {
  description = "The database identifier for naming resources"
  type        = string
  default     = "rds"
}




variable "sns_email" {
  default = "testing@gmail.com"
}