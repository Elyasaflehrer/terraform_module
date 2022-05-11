
# INTERNET_GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_le_saltstack.id
  tags = {
   Name = "vpc_learning_saltstack"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_le_saltstack.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
   Name = "vpc_learning_saltstack"
  }
}

resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.subnet_le_saltstack.id
  route_table_id = aws_route_table.rt.id
}
