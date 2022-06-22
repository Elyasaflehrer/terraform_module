resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = var.cidr_block_pub_sub_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = var.cidr_block_pri_sub_b
  availability_zone       = var.az_b

  tags = {
    Name = "Private Subnet B"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = aws_vpc.vpc_c.id
  cidr_block              = var.cidr_block_pri_sub_c
  availability_zone       = var.az_c

  tags = {
    Name = "Private Subnet C"
  }
}

