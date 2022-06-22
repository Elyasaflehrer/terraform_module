resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "VPC_A GW"
    Project = "VPC_Endpoint"
  }
}