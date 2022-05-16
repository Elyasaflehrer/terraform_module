# SUBNETS
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  availability_zone = var.region_subnet1
  cidr_block = var.cidr_block_subnet1
  tags = {
   Name = "subnet1_alb_project"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc1.id
  availability_zone = var.region_subnet2
  cidr_block = var.cidr_block_subnet2

  tags = {
   Name = "subnet2_alb_project"
  }
}