# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-vpc",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-igw",
    Env  = var.env_name,
    App  = var.app_name,
  })
}