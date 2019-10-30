# Terraform Remote State 사용을 위한 Output 생성 
# terraform refresh 명령으로 state파일에 내용 추가되게 해야함

# Bastion SG
output "bastion_sg_id" {
  value = "${aws_security_group.bastion-sg.id}"
}