output "rds_sg_id" {
    description = "The ID of the security group"
    value       = aws_security_group.rds_sg.id
}