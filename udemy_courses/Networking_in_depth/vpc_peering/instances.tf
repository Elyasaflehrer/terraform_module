locals{
  locals  = jsondecode(file("<PATH>/locals_variables.json"))
}


resource "aws_instance" "pub_web_a" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  subnet_id              = aws_subnet.pub_sub_a.id
  vpc_security_group_ids = [aws_security_group.pub_sg.id]
  key_name               = aws_key_pair.kp.key_name
  tags = {
    Name = "VPC-Peering Pub WEB A"
  }
}

resource "aws_instance" "pri_web_b" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  subnet_id              = aws_subnet.pri_sub_b.id
   key_name               = aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.pri_sg_vpc_a.id]
  tags = {
    Name = "VPC-Peering Pri WEB A"
  }
}

resource "aws_instance" "pri_web_c" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  subnet_id              = aws_subnet.pri_sub_c.id
   key_name               = aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.pri_sg_vpc_b.id]
  tags = {
    Name = "VPC-Peering Pri WEB C"
  }
}




resource "aws_key_pair" "kp" {
  key_name   = "vpc-peering-key_pair"       
  public_key =  local.locals.KEY

}

output "public_ip"{
  value = aws_instance.pub_web_a.public_ip
}
output "private_instance_vpc_a_ip"{
 value = aws_instance.pri_web_b.private_ip
}

output "private_instance_vpc_b_ip"{
 value = aws_instance.pri_web_c.private_ip
}