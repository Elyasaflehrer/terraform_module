
# ROUTE TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = var.cidr_block_route_table
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "route_table_alb_project"
  }
}

resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta_2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}
