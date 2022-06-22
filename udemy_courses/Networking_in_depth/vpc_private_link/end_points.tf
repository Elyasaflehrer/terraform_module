data "aws_caller_identity" "current" {}

resource "aws_vpc_endpoint_service" "nlb_endpoint" {
  acceptance_required        = false
  network_load_balancer_arns = [aws_lb.nlb.arn]

    tags = {
    Name = "VPC-B EndpointService"
    Project_name = "PrivateLink" 
  }
}


resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.vpc_a.id
  service_name      = aws_vpc_endpoint_service.nlb_endpoint.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.endpoint_sg.id]
}