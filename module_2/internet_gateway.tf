# INTERNET_GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc1.id

   tags = {
    Name = "internet_gateway_alb_project"
  }

}