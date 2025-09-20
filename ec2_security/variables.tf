
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

variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string
}

variable "ec2_ssh_cidr_blocks" {
    description = "The CIDR blocks for SSH access to EC2 instances"
    type        = list(string)
    default     = ["0.0.0.0/0"]
}

variable "ec2_http_cidr_blocks" {
    description = "The CIDR blocks for HTTP access to EC2 instances"
    type        = list(string)
    default     = ["0.0.0.0/0"]
}