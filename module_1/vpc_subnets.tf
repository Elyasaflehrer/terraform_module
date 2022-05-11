resource "aws_vpc" "vpc_le_saltstack" {
   cidr_block = var.cidr_block_vpc
   tags = {
   Name = "vpc_learning_saltstack"
  }
}

resource "aws_subnet" "subnet_le_saltstack" {
  cidr_block = var.cidr_block_subnet1
  vpc_id                  = aws_vpc.vpc_le_saltstack.id
  availability_zone = vat.az_1
   tags = {
   Name = "subnet_learning_saltstack"
  }
}