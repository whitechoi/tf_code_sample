# Global variable

# Region
variable "region" {
  description = "The AWS region to create resources in."
  default     = "ap-northeast-2"
}

# AZ
variable "availability_zone_2a" {
  description = "The availability zone"
  default     = "ap-northeast-2a"
}

variable "availability_zone_2c" {
  description = "The availability zone"
  default     = "ap-northeast-2c"
}

# VPC CIDR Range
variable "test-vpc-cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

# Public Subnet CIDR Range
variable "public-subnet-cidr-a" {
  description = "CIDR for the Public Subnet A"
  default     = "10.0.1.0/24"
}

variable "public-subnet-cidr-c" {
  description = "CIDR for the Public Subnet C"
  default     = "10.0.2.0/24"
}

# Private Subnet CIDR Range
variable "private-subnet-cidr-a" {
  description = "CIDR for the Private Subnet A"
  default     = "10.0.50.0/24"
}

variable "private-subnet-cidr-c" {
  description = "CIDR for the Private Subnet C"
  default     = "10.0.51.0/24"
}

# S3 EndPoint
variable "s3-vpc-endpint-service-name" {
  description = "s3-service-endpint-service-name"
  default     = "com.amazonaws.ap-northeast-2.s3"
}

