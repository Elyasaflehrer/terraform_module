resource "aws_vpc" "vpc_a" {
  cidr_block       = var.cidr_block_vpc_a 

  tags = {
    Name = "VPC-Peering A"
  }
}

resource "aws_vpc" "vpc_b" {
  cidr_block       = var.cidr_block_vpc_b

  tags = {
    Name = "VPC-Peering B"
  }
}

