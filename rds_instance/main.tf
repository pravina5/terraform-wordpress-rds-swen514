# DB Subnet Group
resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.app_name}-${var.env_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-db-subnet-group",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# RDS Instance
resource "aws_db_instance" "db_instance" {
  identifier           = "${var.app_name}-${var.env_name}-db-instance" # Unique identifier for the RDS instance
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.rds_instance_type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"  # Default parameter group for MySQL 8.0
  skip_final_snapshot  = var.skip_final_snapshot  # Skip final snapshot when destroying the database
  vpc_security_group_ids = var.security_groups  # Attach the RDS security group
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name  # Use the created subnet group

  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-db-instance",
    Env  = var.env_name,
    App  = var.app_name,
  })
}