resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_openswan.id

  tags = {
    Name = "gw Openswan"
  }
}