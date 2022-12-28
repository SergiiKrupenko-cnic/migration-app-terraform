output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.this.id, "")
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

/*output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "nat_eip_id" {
  value = aws_eip.nat_eip[*].id
}*/