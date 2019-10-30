# WEB Server Variable - Single

# WEB Server EC2 Type - 적합한 크기로 변경
variable "web_instance_type" {
  default = "t2.micro"
}

# WEB & APP AMI - 적합한 AMI로 변경
variable "amazon_linux_2_ami" {
  description = "amazon_linux_2_ami"
  default = "ami-018a9a930060d38aa"
}

