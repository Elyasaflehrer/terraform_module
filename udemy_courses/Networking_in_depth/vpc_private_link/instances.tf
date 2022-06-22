locals{
  locals  = jsondecode(file("<PATH>/locals_variables.json"))
}

resource "aws_instance" "instance_a" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_a.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "Privatelink WEB_A"
  }
}
resource "aws_instance" "instance_b" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet_b.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

    provisioner "local-exec" {
       command = <<EOT
             sudo yum install httpd -y
             service httpd start
             chkconfig httpd on
             echo "This is my web server" > /var/www/html/index.html
             echo "successful"
       EOT
      
    }
   
  tags = {
    Name = "Privatelink WEB_B"
  }
}



resource "aws_key_pair" "kp" {
  key_name   = "myKey_Privatelink"       
  public_key = local.locals.KEY
}

output "publicIp" {
    value = aws_instance.instance_a.public_ip
}

output "privateIp" {
    value = aws_instance.instance_b.private_ip
}


