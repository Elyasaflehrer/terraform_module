
# INTERNET_GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
   Name = "VPC-Peering IGW"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
   Name = "VPC-Peering Public RT"
  }
}

resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.pub_sub_a.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
   Name = "VPC-Peering Private RT"
  }
}
resource "aws_route_table_association" "rta_2" {
  subnet_id      = aws_subnet.pri_sub_b.id
  route_table_id = aws_route_table.pri_rt.id
}

resource "aws_route_table" "pri_rt_sub_c" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
   Name = "VPC-Peering Private Sub_C RT"
  }
}
resource "aws_route_table_association" "rta_c" {
  subnet_id      = aws_subnet.pri_sub_c.id
  route_table_id = aws_route_table.pri_rt_sub_c.id
}

