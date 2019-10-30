# WEB Server
resource "aws_instance" "web-server" {
  ami           = "${var.amazon_linux_2_ami}"
  instance_type = "${var.web_instance_type}" 
  subnet_id = "${data.terraform_remote_state.vpc_data.private_subnet_a_id}"

  # instance_count         = 1
  
  # Key Pair는 직접 생성한 키를 적용하는 걸 권장하며 키페어 생성내용은 제외
  key_name  = "sample_key"
  
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]

  associate_public_ip_address = false
  
  # private_ip = "x.x.x.x" or 변수처리
  
  # user_data  = "${file("web_server_init.txt")}" 파일에서 읽어오게 설정
  
  # iam_instance_profile = "${aws_iam_instance_profile.test_profile.id}" 직접 지정 가능 
  
  #EC2 Instance Termination Protection 적용
  # disable_api_termination = true

  root_block_device {
    volume_size           = "8" # 유효한 사이즈로 변경
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags {
    Name = "WEB-SERVER"
  }
}

