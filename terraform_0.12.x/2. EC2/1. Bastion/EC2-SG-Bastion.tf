# bastion instance Security Group
resource "aws_security_group" "bastion-sg" {
  name   = "bastion-sg"
  vpc_id = data.terraform_remote_state.vpc_data.outputs.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #SSH 접속 IP대역 지정
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

