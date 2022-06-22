resource "aws_subnet" "public_subnet_openswan" {
  vpc_id                  = aws_vpc.vpc_openswan.id
  cidr_block              = var.cidr_block_pub_sub_openswan
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet Openswan"
  }
}


