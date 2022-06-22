resource "aws_vpc" "vpc_runatlantis_server" {
   cidr_block = var.cidr_block_vpc
   tags = {
   Name = "vpc__runatlantis"
  }
}

resource "aws_subnet" "subnet1_runatlantis_server" {
  cidr_block = var.cidr_block_subnet1
  vpc_id                  = aws_vpc.vpc_runatlantis_server.id
  map_public_ip_on_launch = true
  availability_zone = var.az_1
   tags = {
   Name = "subnet1_runatlantis"
  }
}
resource "aws_subnet" "subnet2_runatlantis_server" {
  vpc_id                  = aws_vpc.vpc_runatlantis_server.id
  availability_zone       = var.az_2
  cidr_block              = var.cidr_block_subnet2
  map_public_ip_on_launch = true
  tags = {
   Name = "subnet1_runatlantis"
  }

}

