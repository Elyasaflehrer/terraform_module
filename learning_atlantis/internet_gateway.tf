
# INTERNET_GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_runatlantis_server.id
  tags = {
   Name = "internet_gateway_runatlantis"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_runatlantis_server.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
   Name = "route_table_runatlantis"
  }
}

resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.subnet1_runatlantis_server.id
  route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "rta_2" {
  subnet_id      = aws_subnet.subnet2_runatlantis_server.id
  route_table_id = aws_route_table.rt.id
}

