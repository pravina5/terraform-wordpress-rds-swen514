# Random id
resource "random_id" "id" {
  byte_length = 4
}

# EC2 security group
resource "aws_security_group" "ec2_sg" {
  name        = "${var.app_name}-${var.env_name}-ec2_sg-${random_id.id.hex}"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-ec2-sg-${random_id.id.hex}",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# EC2 security group ingress rules
resource "aws_security_group_rule" "ec2_ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks       = var.ec2_http_cidr_blocks
}
resource "aws_security_group_rule" "ec2_ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks       = var.ec2_ssh_cidr_blocks
}
resource "aws_security_group_rule" "ec2_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}