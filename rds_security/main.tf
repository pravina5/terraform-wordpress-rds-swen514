# Random id
resource "random_id" "id" {
  byte_length = 4
}

# RDS security group
resource "aws_security_group" "rds_sg" {
  name        = "${var.app_name}-${var.env_name}-rds-sg-${random_id.id.hex}"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-rds-sg-${random_id.id.hex}",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# RDS security group ingress rules
resource "aws_security_group_rule" "rds_ingress" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  source_security_group_id   = var.source_security_group_id
}