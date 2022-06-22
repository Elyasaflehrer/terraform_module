locals {
  my_publicIp =  jsondecode(file("/home/elyasaf/work/my_publicIp.json"))
}

resource "aws_security_group" "pub_sg" {
  vpc_id = aws_vpc.vpc_a.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [locals.my_publicIp.publicIp]
  }

   ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.cidr_block_vpc_a, var.cidr_block_vpc_b ]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
   Name = "VPC-Peering SG"
  }
}

resource "aws_security_group" "pri_sg_vpc_a" {
  vpc_id = aws_vpc.vpc_a.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block_vpc_a]
  }

     ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.cidr_block_vpc_a, var.cidr_block_vpc_b]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
   Name = "VPC-Peering SG"
  }
}


resource "aws_security_group" "pri_sg_vpc_b" {
  vpc_id = aws_vpc.vpc_b.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block_vpc_b, var.cidr_block_vpc_a]
  }
     ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.cidr_block_vpc_a, var.cidr_block_vpc_b ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
   Name = "VPC-Peering SG"
  }
}


