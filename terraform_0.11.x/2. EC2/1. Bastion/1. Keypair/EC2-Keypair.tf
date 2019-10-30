# 키페어를 새로 생성할 경우, 기존 키페어는 terraform import해서 ec2 생성용도로 작성한 .tf 파일에 이름 그대로 지정해도됨
# 암호화 되지 않은 형태로 State 파일에 저장되기 때문에 직접 생성 하는 걸 권장

# EC2 Key Pair
# RSA_4096 Key 생성
resource "tls_private_key" "test_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 위에 생성한 키 EC2 Key Pair에 등록 
resource "aws_key_pair" "id_rsa_aws" {
  key_name   = "id_rsa_aws"
  public_key = "${tls_private_key.test_key.public_key_openssh}"
}

