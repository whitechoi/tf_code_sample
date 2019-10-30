resource "aws_lb_target_group" "web_alb_target_group" {
  name     = "web-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc_data.outputs.vpc_id

  #deregistration_delay = 600 # default 300

  #slow_start = 30 # default 0

  health_check {
    interval            = 30
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = 200
  }

  tags = {
    Name = "WEB-ALB-TargetGroup"
  }
}

resource "aws_lb_target_group_attachment" "web_alb_target_group_attach" {
  target_group_arn = aws_lb_target_group.web_alb_target_group.arn
  target_id        = aws_instance.web-server.id
  port             = 80
}

