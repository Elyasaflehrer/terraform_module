resource "aws_lb" "nlb" {
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet_nlb_c.id, aws_subnet.private_subnet_nlb_d.id]

  enable_deletion_protection = false

  tags = {
    Name = "NLB PrivateLink"
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"
 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}
