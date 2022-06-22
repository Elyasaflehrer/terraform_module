resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = var.cidr_block_pub_sub_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = "VPC_Endpoint PublicSubnet A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = var.cidr_block_pri_sub_b
  availability_zone       = var.az_b

  tags = {
    Name = "VPC_Endpoint PrivateSubnet B"
  }
}

