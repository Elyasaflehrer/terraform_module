locals {
  my_publicIp =  jsondecode(file("/home/elyasaf/work/my_publicIp.json"))
}

resource "aws_security_group" "vpc_a_public_sg" {
  name        = "VPC_A Public-SG"
  vpc_id      = aws_vpc.vpc_a.id
 
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [locals.my_publicIp.publicIp ,var.cidr_block_vpc_a]
  }

  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.cidr_block_vpc_a]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Public_VPC_A-SG"
    Project = "VPC_Endpoint"
  }
}



resource "aws_security_group" "vpc_a_private_sg" {
  name        = "VPC_A Private-SG"
  vpc_id      = aws_vpc.vpc_a.id
 
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block_vpc_a]
  }

    ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.cidr_block_vpc_a]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Private_VPC_A-SG"
    Project = "VPC_Endpoint"
  }
}
