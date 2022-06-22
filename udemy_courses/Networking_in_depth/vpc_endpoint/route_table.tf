resource "aws_route_table" "route_table_vpc_a" {
  vpc_id = aws_vpc.vpc_a.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "VPC_Endpoint_PublicRT A"
    Project = "VPC_Endpoint"
  }
}

resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.route_table_vpc_a.id
}

resource "aws_route_table" "route_table_vpc_b" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "VPC_Endpoint_PrivateRT B"
    Project = "VPC_Endpoint"
  }
}
resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.route_table_vpc_b.id
}



