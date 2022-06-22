resource "aws_vpc" "vpc_openswan" {
  cidr_block       = var.cidr_block_vpc_openswan

  tags = {
    Name = "VPC OpenSwan"
  }
}
