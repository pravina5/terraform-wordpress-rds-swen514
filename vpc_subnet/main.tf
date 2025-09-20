# Random id
resource "random_id" "id" {
  byte_length = 4
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs[0]
  availability_zone       = var.subnet_azs[0]
  map_public_ip_on_launch = true
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-public-subnet-${random_id.id.hex}",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidrs[1]
  availability_zone = var.subnet_azs[1]
  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-private-subnet-${random_id.id.hex}",
    Env  = var.env_name,
    App  = var.app_name,
  })
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = merge(var.additional_tags, {
        Name = "${var.app_name}-${var.env_name}-public-rt-${random_id.id.hex}",
        Env  = var.env_name,
        App  = var.app_name,
    })
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_rta" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}