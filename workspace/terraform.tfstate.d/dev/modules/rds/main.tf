resource "aws_db_instance" "rds" {
  identifier           = var.db_instance_identifier
  db_name              = var.db_name
  username             = var.username
 # password             = var.password
  manage_master_user_password = true                         # store the password into secret manager 
  instance_class       = var.db_instance_class
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az             = false
  publicly_accessible  = false
  skip_final_snapshot  = true

  # Automatic backup configuration
  backup_retention_period   = var.backup_retention_period
  


  tags = {
    Name    = "RDS-${var.db_instance_identifier}-${var.project_name}-${var.stage_name}"
    Env     = var.stage_name
    Project = var.project_name
  }
}


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id
  description = "Security group for RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Adjust CIDR block based on your VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS-SG-${var.project_name}-${var.stage_name}"
  }
}
