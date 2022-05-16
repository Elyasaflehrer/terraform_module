# VPC
resource "aws_vpc" "vpc1" {
  cidr_block      = var.cidr_block_vpc  

  tags = {
    Name = "vpc_alb_project"
  }
}

