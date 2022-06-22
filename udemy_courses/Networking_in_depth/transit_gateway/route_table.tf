resource "aws_route_table" "route_table_vpc_a" {
  vpc_id = aws_vpc.vpc_a.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
route {
    cidr_block = var.cidr_block_vpc_c_b_c
    gateway_id = aws_ec2_transit_gateway.transit_gw.id
  }
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_ec2_transit_gateway.transit_gw.id
  }


  tags = {
    Name = "PublicRT A"
  }
}

resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.route_table_vpc_a.id
}

resource "aws_route_table" "route_table_vpc_b" {
  vpc_id = aws_vpc.vpc_b.id

   route {
    cidr_block = var.cidr_block_vpc_c_b_c
    gateway_id = aws_ec2_transit_gateway.transit_gw.id
  }

  tags = {
    Name = "PrivateRT B"
  }
}
resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.route_table_vpc_b.id
}



resource "aws_route_table" "route_table_vpc_c" {
  vpc_id = aws_vpc.vpc_c.id

  route {
    cidr_block = var.cidr_block_vpc_c_b_c
    gateway_id = aws_ec2_transit_gateway.transit_gw.id
  }

  tags = {
    Name = "PrivateRT C"
  }
}

resource "aws_route_table_association" "rta_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.route_table_vpc_c.id
}





# resource "aws_vpn_gateway_route_propagation" "example" {
#   vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
#   route_table_id = aws_route_table.route_table_public.id
# }