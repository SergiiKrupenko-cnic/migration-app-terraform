output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the VPC"
  value       = module.vpc.public_subnet_id
}

/*output "private_subnet_id" {
  description = "The ID of the VPC"
  value       = module.vpc.private_subnet_id
}*/
