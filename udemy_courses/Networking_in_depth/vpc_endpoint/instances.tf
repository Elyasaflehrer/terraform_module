locals{
  local  = jsondecode(file("<PATH>/locals_variables.json"))
}


resource "aws_instance" "instance_a" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_a.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.vpc_a_public_sg.id]

  tags = {
    Name = "VPC-EndPoint WEB_A"
  }
}
resource "aws_instance" "instance_b" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet_b.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.vpc_a_private_sg.id]

  tags = {
    Name = "VPC-EndPoint WEB_B"
  }
}



resource "aws_key_pair" "kp" {
  key_name   = "myKey_vpc_endpoint"       
  public_key = local.local.KEY
}

output "publicIp" {
    value = aws_instance.instance_a.public_ip
}

output "privateIp" {
    value = aws_instance.instance_b.private_ip
}


