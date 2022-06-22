resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc_openswan.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRT B"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_openswan.id
  route_table_id = aws_route_table.route_table_public.id
}

