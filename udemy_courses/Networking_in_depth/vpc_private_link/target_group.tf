resource "aws_lb_target_group" "nlb_tg" {
  name     = "PrivateLing-TG"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc_b.id

  tags = {
    Name = "VPC-B-TG"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = aws_instance.instance_b.id
  port             = 80
}
