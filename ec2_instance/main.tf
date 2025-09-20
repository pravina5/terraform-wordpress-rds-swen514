# Random id
resource "random_id" "id" {
  byte_length = 4
}


# AMI Data Source
data "aws_ami" "amazon_linux_2023" {
  most_recent = true    # Get the latest version of the AMI
  owners      = ["amazon"]  # Only accept Amazon-owned AMIs

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]  # Filter for Amazon Linux 2023 AMIs
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]  # Hardware Virtual Machine AMIs only
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]  # EBS-backed instances only
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]  # 64-bit x86 architecture only
  }
}

# EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id  # Use the AMI we filtered above
  instance_type          = var.ec2_instance_type  # Free tier eligible instance type
  subnet_id              = var.subnet_id  # Place in the public subnet
  vpc_security_group_ids = var.security_groups  # Attach the EC2 security group
  key_name               = var.ssh_key_name  # Replace with your SSH key pair name

  # TODO: Pass in the 4 variables to the user data script
  user_data = var.user_data_script   

  tags = merge(var.additional_tags, {
    Name = "${var.app_name}-${var.env_name}-ec2-instance-${random_id.id.hex}",
    Env  = var.env_name,
    App  = var.app_name,
  })
}