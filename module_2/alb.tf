
resource "aws_lb" "aws_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets = alb_subnets
  security_groups = var.security_groups

  tags = {
    Name = "alb_project"
  }
}

# LB LEASTINER
resource "aws_lb_listener" "alb_leastiner" {
  load_balancer_arn = aws_lb.aws_lb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn = aws_acm_certificate_validation.acm_cer_vali.certificate_arn
  
  default_action {
     type             = "forward"
     target_group_arn = aws_lb_target_group.tg_1.arn
  }

  tags = {
    Name = "alb_project"
  }
}

resource "aws_lb_listener" "alb_leastiner_http" {
  load_balancer_arn = aws_lb.aws_lb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
     type             = "forward"
     target_group_arn = aws_lb_target_group.tg_1.arn
  }

  tags = {
    Name = "alb_project"
  }
}







