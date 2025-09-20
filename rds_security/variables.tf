
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

variable "source_security_group_id" {
    description = "The source security group ids to associate with the RDS instance"
    type        = string
}