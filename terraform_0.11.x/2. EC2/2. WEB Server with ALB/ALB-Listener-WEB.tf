resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = "${aws_lb.web-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_alb_target_group.arn}"
  }
  
  /* HTTP to HTTPS redirect
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  */
}
/* HTTPS Listener
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = "${aws_lb.web-alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "ACM 인증서 ARN"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_target_group.arn}"
  }
}
*/


# Forward Path/Host Rule
/* Path Rule
resource "aws_lb_listener_rule" "static" {
  listener_arn = "${aws_lb_listener.web-alb.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_alb_target_group.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/static/*"]
  }
}
*/

/* Host Rule
resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = "${aws_lb_listener.web-alb.ar}"
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_alb_target_group.arn}"
  }

  condition {
    field  = "host-header"
    values = ["my-service.*.terraform.io"]
  }
}
*/

# Redirect Path/Host Rule

/*
resource "aws_lb_listener_rule" "redirect_http_to_https" {
  listener_arn = "${aws_lb_listener.web-alb.arn}"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    field  = "host-header"
    values = ["my-service.*.terraform.io"]
  }
}
*/
