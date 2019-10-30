# Terraform Remote State 사용을 위한 Output 생성 
# terraform refresh 명령으로 state파일에 내용 추가되게 해야함

# Region
output "region_id" {
  value = var.region
}

# AZ
output "zone_a_id" {
  value = var.availability_zone_2a
}

output "zone_c_id" {
  value = var.availability_zone_2c
}

# VPC ID
output "vpc_id" {
  value = aws_vpc.test-vpc.id
}

# Public Subnet ID
output "public_subnet_a_id" {
  value = aws_subnet.test-vpc-subnet-public-a.id
}

output "public_subnet_c_id" {
  value = aws_subnet.test-vpc-subnet-public-c.id
}

# Private Subnet ID
output "private_subnet_a_id" {
  value = aws_subnet.test-vpc-subnet-private-a.id
}

output "private_subnet_c_id" {
  value = aws_subnet.test-vpc-subnet-private-c.id
}

