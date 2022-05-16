# TARGATE_GROUP
resource "aws_lb_target_group_attachment" "tga_1" {
  target_group_arn = aws_lb_target_group.tg_1.arn
  target_id        = aws_instance.instance_1.id
}

resource "aws_lb_target_group_attachment" "tga_2" {
  target_group_arn = aws_lb_target_group.tg_1.arn
  target_id        = aws_instance.instance_2.id
}

resource "aws_lb_target_group" "tg_1" {
  name        = "tg-1-alp-project"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc1.id

   tags = {
    Name = "target_group1_alb_project"
  }
}

