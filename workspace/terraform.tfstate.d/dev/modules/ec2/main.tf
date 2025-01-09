resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Allow specific inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}




resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.ec2_sg.id]
  //security_group_id     = [aws_security_group.ec2_sg.id]
   //key_name                    = var.key_pair_name
   key_name               =  aws_key_pair.ec2_key_pair.key_name                                             
  associate_public_ip_address = true
  tags = {
    Name = var.project_name
    Environment = var.stage_name
  }
}



     ############## KEY PAIR   SECRET MANAGER #########


 
  # Generate a key pair dynamically
resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create a key pair in AWS using the generated public key
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "${var.project_name}-${var.stage_name}-ec2-key"
  public_key = tls_private_key.ec2_key_pair.public_key_openssh
}

# Store the private key securely in AWS Secrets Manager
resource "aws_secretsmanager_secret" "private_key" {
  name        = "${var.project_name}-${var.stage_name}-ec2-private-key-RDS"
  description = "Private key for SSH access to the EC2 instance"
}

resource "aws_secretsmanager_secret_version" "private_key_version" {
  secret_id     = aws_secretsmanager_secret.private_key.id
  secret_string = tls_private_key.ec2_key_pair.private_key_pem
}
