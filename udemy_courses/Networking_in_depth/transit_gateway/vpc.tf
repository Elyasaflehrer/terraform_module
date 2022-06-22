resource "aws_vpc" "vpc_a" {
  cidr_block       = var.cidr_block_vpc_a

  tags = {
    Name = "VPC-A"
  }
}

resource "aws_vpc" "vpc_b" {
  cidr_block       = var.cidr_block_vpc_b

  tags = { 
    Name = "VPC-B"
  }
}


resource "aws_vpc" "vpc_c" {
  cidr_block       = var.cidr_block_vpc_c

  tags = {
    Name = "VPC-C"
  }
}


resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.vpc_a.id
  cidr_block = "10.40.0.0/16"
}