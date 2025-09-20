
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

variable "subnet_cidrs" {
    description = "The CIDR blocks for the subnets"
    type        = list(string)
}

variable "subnet_azs" {
    description = "The availability zones to deploy resources in"
    type        = list(string)
}

variable "igw_id" {
    description = "The CIDR block for the IGW"
    type        = string
}