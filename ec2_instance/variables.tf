
variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string
}

variable "app_name" {
    description = "The name of the VPC"
    type        = string
}

variable "env_name" {
    description = "The name of the VPC"
    type        = string
}

variable "additional_tags" {
    description = "Tags to apply to resources"
    type        = map(string)
    default     = {}
}

variable "subnet_id" {
    description = "The subnet id to deploy resources in"
    type        = string
}

variable "ec2_instance_type" {
    description = "The type of EC2 instance to deploy"
    type        = string
    default     = "t3.micro"
}

variable "ssh_key_name" {
    description = "The name of the SSH key pair to use for EC2 instances"
    type        = string
    sensitive   = true
}

variable "security_groups" {
    description = "The security group ids to associate with the EC2 instance"
    type        = list(string)
}

variable "user_data_script" {
    description = "The user data script to run on instance launch"
    type        = string
    default     = ""
}