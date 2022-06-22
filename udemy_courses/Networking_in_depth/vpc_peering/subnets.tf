resource "aws_subnet" "pub_sub_a" {
  cidr_block = var.cidr_block_pub_sup_a
  vpc_id                  = aws_vpc.vpc_a.id
  map_public_ip_on_launch = true
  availability_zone = var.az_a
   tags = {
   Name = "VPC-Peering Public Subnet A"
  }
}
resource "aws_subnet" "pri_sub_b" {
  vpc_id                  = aws_vpc.vpc_a.id
  availability_zone       = var.az_b
  cidr_block              = var.cidr_block_pri_sup_b
  tags = {
   Name = "VPC-Peering Private_Subnet B"
  }

}

resource "aws_subnet" "pri_sub_c" {
  vpc_id                  = aws_vpc.vpc_b.id
  availability_zone       = var.az_c
  cidr_block              = var.cidr_block_pri_sup_c
  tags = {
   Name = "VPC-Peering Private_Subnet C"
  }

}

