# TARGATE_GROUP

resource "aws_lb_target_group" "tg_1" {
  name        = "tg-1-runatlantis-server"
  port        = var.port_tg_1
  protocol    = var.protocol_tg_1
  vpc_id      = aws_vpc.vpc_runatlantis_server.id
}

resource "aws_lb_target_group_attachment" "tga_runatlantis_ser_port4141" {
  target_group_arn = aws_lb_target_group.tg_port_4141.arn
  target_id        = aws_instance.runatlantis_server.id
}

resource "aws_lb_target_group_attachment" "tga_runatlantis_ser" {
  target_group_arn = aws_lb_target_group.tg_1.arn
  target_id        = aws_instance.runatlantis_server.id
}

resource "aws_lb_target_group" "tg_port_4141" {
  name        = "tg-port-4141-runatlantis-serve"
  port        = var.port_tg_port_4141
  protocol    = var.protocol_tg_port_4141
  vpc_id      = aws_vpc.vpc_runatlantis_server.id
}



