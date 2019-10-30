# Bastion Variable

# Bastion EC2 Type
variable "bastion_instance_type" {
  default = "t2.micro"
}

# Bastion AMI
variable "bastion_amis" {
  description = "Amazon Linux AMI 2"
  default     = "ami-018a9a930060d38aa"
}

