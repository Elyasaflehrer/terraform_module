resource "aws_ec2_transit_gateway" "transit_gw" {
  description = "Transit_GW"

   tags = {
    Name = "Transit_GW"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tarnsit_gw_vpc_a" {
  subnet_ids         = [aws_subnet.public_subnet_a.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gw.id
  vpc_id             = aws_vpc.vpc_a.id
     tags = {
    Name = "Transit_GW_VPC_A"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tarnsit_gw_vpc_b" {
  subnet_ids         = [aws_subnet.private_subnet_b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gw.id
  vpc_id             = aws_vpc.vpc_b.id
     tags = {
    Name = "Transit_GW_VPC_B"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tarnsit_gw_vpc_c" {
  subnet_ids         = [aws_subnet.private_subnet_c.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gw.id
  vpc_id             = aws_vpc.vpc_c.id
     tags = {
    Name = "Transit_GW_VPC_C"
  }
}


