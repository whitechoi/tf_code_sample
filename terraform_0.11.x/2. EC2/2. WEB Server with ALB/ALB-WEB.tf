# Application Load Balancer
resource "aws_lb" "web-alb" {
  name = "web-alb"
  
  internal = false

  load_balancer_type = "application"

  subnets         = ["${data.terraform_remote_state.vpc_data.public_subnet_a_id}", "${data.terraform_remote_state.vpc_data.public_subnet_c_id}"]
  
  security_groups = ["${aws_security_group.web-alb-sg.id}"]
  
  #enable_deletion_protection = true # default false
   
  #enable_cross_zone_load_balancing    = true # default talse
  #idle_timeout                = 400 #default 60

  #enable_http2 = false # default true

  #ip_address_type = dualstack # default ipv4 

  /* LB 액세스로그를 저장할 경우
  access_logs {
    bucket  = "${aws_s3_bucket.lb_logs.bucket}"
    prefix  = "test-lb"
    enabled = true
  }
  */
  tags {
    Name = "WEB-ALB"
  }
}
