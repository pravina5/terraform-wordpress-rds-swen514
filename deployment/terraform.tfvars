region = "us-east-2"
app_name = "wordpress"
env_name = "dev"
additional_tags = {
  "Owner" = "Jheel Patel"
  "Project" = "WordPress Deployment"
}

# VPC configuration
vpc_cidr = "10.0.0.0/16"
subnet_azs = ["us-east-2a", "us-east-2b"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# EC2 configuration
user_data_template = "./scripts/wp_rds_install.sh"