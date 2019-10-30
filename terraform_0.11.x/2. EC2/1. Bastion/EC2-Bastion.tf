# Bastion Server
resource "aws_instance" "bastion-server" {
  ami           = "${var.bastion_amis}"
  instance_type = "${var.bastion_instance_type}"
  subnet_id = "${data.terraform_remote_state.vpc_data.public_subnet_a_id}"
  
  # Key Pair는 직접 생성한 키를 적용하는 걸 권장
  key_name  = "sample_key"
  
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]

  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags {
    Name = "BASTION-SERVER"
  }
}

resource "aws_eip" "bastion-eip" {
  vpc        = true
  instance   = "${aws_instance.bastion-server.id}"
  depends_on = ["aws_instance.bastion-server"]
  tags {
    Name = "BASTION-EIP"
  }
}