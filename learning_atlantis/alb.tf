
resource "aws_lb" "lb_atlantis_ser" {
  name               = "alb-atlantis-ser"
  internal           = false
  load_balancer_type = "application"
  subnets = [ aws_subnet.subnet1_runatlantis_server.id, aws_subnet.subnet2_runatlantis_server.id]
  security_groups = [aws_security_group.sg_learning_atlantis.id]
  }
# LB LEASTINER
resource "aws_lb_listener" "alb_listener_1" {
  load_balancer_arn = aws_lb.lb_atlantis_ser.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn = aws_acm_certificate_validation.acm_cer_vali_atlantis_ser.certificate_arn
  
  default_action {
     type             = "forward"
     target_group_arn =  aws_lb_target_group.tg_port_4141.arn
  }

  tags = {
    Name = "listener1_atlantis_ser"
  }
}

resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.lb_atlantis_ser.arn
  port              = var.port_alb_leastiner_http
  protocol          = var.protocol_alb_leastiner_http
  
  
   default_action {
     type = "redirect"

   redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  tags = {
    Name = "alb_project"
  }
}

resource "aws_lb_listener_rule" "listenere_rule_port4141" {
  listener_arn = aws_lb_listener.alb_listener_1.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_port_4141.arn
  }

  condition {
    host_header {
      values = ["atlantis_server.cclab.cloud-castles.com"]
    }
  }
}

