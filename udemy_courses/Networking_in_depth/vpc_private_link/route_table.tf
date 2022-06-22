resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc_a.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "VPC_PrivateLink_PublicRT A"
  }
}

resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table" "pri_route_table" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "VPC_PrivateLink_PrivateRT B"
  }
}
resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.pri_route_table.id
}

resource "aws_route_table_association" "rta_c" {
  subnet_id      = aws_subnet.private_subnet_nlb_c.id
  route_table_id = aws_route_table.pri_route_table.id
}

resource "aws_route_table_association" "rta_d" {
  subnet_id      = aws_subnet.private_subnet_nlb_d.id
  route_table_id = aws_route_table.pri_route_table.id
}



