resource "aws_vpc" "vpc_a" {
  cidr_block       = var.cidr_block_vpc_a

  tags = {
    Name = "VPC_Endpoint A"
  }
}

