# Web Server instance Security Group
resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  vpc_id      = "${data.terraform_remote_state.vpc_data.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${data.terraform_remote_state.bastion_data.bastion_sg_id}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.web-alb-sg.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags {
    Name = "WEB-SG"
  }

}
