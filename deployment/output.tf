output "ec2_public_ip" {
    value = module.ec2_instance.ec2_instance_public_ip
}

output "rds_endpoint" {
    value = module.rds_instance.rds_instance_endpoint
}