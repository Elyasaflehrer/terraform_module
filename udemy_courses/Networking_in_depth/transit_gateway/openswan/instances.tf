resource "aws_instance" "instance_1" {
  ami           = var.ami_aws_linux
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_openswan.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_myIp.id]
  source_dest_check      = false

  tags = {
    Name = "instance_1"
  }
}



resource "aws_key_pair" "kp" {
  key_name   = "myKey_udemy_course"       
  public_key = var.pub_key_pair
}

output "publicIp" {
    value = aws_instance.instance_1.public_ip
}

