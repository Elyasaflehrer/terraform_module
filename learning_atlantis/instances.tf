resource "aws_instance" "runatlantis_server" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type_ubuntu
  subnet_id              = aws_subnet.subnet1_runatlantis_server.id
  vpc_security_group_ids = [aws_security_group.sg_learning_atlantis.id]
  key_name               = aws_key_pair.kp.key_name
  tags = {
    Name = "runatlantis_server"
  }
}



