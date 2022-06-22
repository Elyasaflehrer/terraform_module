resource "aws_instance" "instance_a" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_a.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.vpc_a_sg.id]

  tags = {
    Name = "WEB_A"
  }
}
resource "aws_instance" "instance_b" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet_b.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.vpc_b_sg.id]

  tags = {
    Name = "WEB_B"
  }
}
resource "aws_instance" "instance_c" {
  ami           = var.ami_instance 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet_c.id
  key_name      =  aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.vpc_c_sg.id]

  tags = {
    Name = "WEB_C"
  }
}



resource "aws_key_pair" "kp" {
  key_name   = "myKey_udemy_course"       
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCSTewr5KrqfQuwSO5I4jCAsFtYMq+9Sxf4kkB+DJk4RutxmhntBOxD4FRE6yoo/lk3KdxL0VPg0dEvovEXSmtyFS3sxUZv+MQvhF7UarPJ5TJCkQeeTWgHWSOMXhM55UGIXgVBoaDSELojxvdYoFLaC63CGA8FRLIifn+fXTli9Ma5K+bsjzOBquXKYAjLxK8UVh397pulqT5Oi5EPRqpfBdQKRAg8aLd5dpzBaMAQOx65kD3AvJHebpYK80nm3bDTQj+HpHdxFw2YbPIvx0AX5JWLEqAqTHALkgkqjyR4epWJMADjmPdNumHgqQPoaW9OivXsEq70hXlAXl07obF6dvvSVZPiT2JSe64Jc7zmcEc57t9Ze5dLNiIMVVa98UIuG/oreffxsjlAm6mCYvbTCWDz7csC3G0RQz+b/OysmmWlBV9XQGb2+I9TdGIuQ7renLB0tVnUC4TJXHfZ9deyLyxdR9KoquFj+axpVWGkqyI40PNCbcPo4BdKIR0d1b0= ubuntu@ip-172-31-22-109"
}

output "publicIp" {
    value = aws_instance.instance_a.public_ip
}

