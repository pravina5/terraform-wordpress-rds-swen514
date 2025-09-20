
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

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "additional_tags" {
    description = "Tags to apply to resources"
    type        = map(string)
    default     = {}
}

variable "enable_dns_hostnames" {
    description = "Enable DNS hostnames in the VPC"
    type        = bool
    default     = true
}

variable "enable_dns_support" {
    description = "Enable DNS support in the VPC"
    type        = bool
    default     = true
}