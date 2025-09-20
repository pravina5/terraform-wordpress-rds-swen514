
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

variable "subnet_ids" {
    description = "The subnet id to deploy resources in"
    type        = list(string)
}

variable "rds_instance_type" {
    description = "The type of RDS instance to deploy"
    type        = string
    default     = "db.t3.micro"
}

variable "db_name" {
    description = "The name of the database"
    type        = string
}

variable "db_username" {
    description = "The username for the database"
    type        = string
    sensitive   = true
}

variable "db_password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
}

variable "security_groups" {
    description = "The security group ids to associate with the EC2 instance"
    type        = list(string)
}

variable "skip_final_snapshot" {
    description = "Skip final snapshot"
    type        = bool
    default     = true
}

variable "allocated_storage" {
    description = "The allocated storage for the RDS instance"
    type        = number
    default     = 20
}

variable "storage_type" {
    description = "The storage type for the RDS instance"
    type        = string
    default     = "gp2"
}

variable "engine" {
    description = "The database engine for the RDS instance"
    type        = string
    default     = "mysql"
}

variable "engine_version" {
    description = "The database engine version for the RDS instance"
    type        = string
    default     = "8.0"
}

