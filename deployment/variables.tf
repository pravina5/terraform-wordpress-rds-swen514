variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string
}

variable "app_name" {
    description = "The name of the application"
    type        = string
}

variable "env_name" {
    description = "The name of the dployment environment"
    type        = string
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "subnet_cidrs" {
    description = "The CIDR blocks for the subnets"
    type        = list(string)
}

variable "subnet_azs" {
    description = "The availability zones to deploy resources in"
    type        = list(string)
}

variable "additional_tags" {
    description = "Tags to apply to resources"
    type        = map(string)
    default     = {}
}

variable "ssh_key_name" {
    description = "The name of the SSH key pair to use for EC2 instances"
    type        = string
    sensitive = true
}

variable "db_username" {
    description = "The username for the database"
    type        = string
    sensitive = true
}

variable "db_password" {
    description = "The password for the database"
    type        = string
    sensitive = true
}

variable "db_name" {
    description = "The name of the database"
    type        = string
    sensitive = true
}

variable "user_data_template" {
    description = "The user data script to run on EC2 instances"
    type        = string
    default     = null
}