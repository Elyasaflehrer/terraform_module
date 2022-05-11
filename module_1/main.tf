resource "aws_instance" "master_le_saltstack" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type_ubuntu
  key_name               = aws_key_pair.keypair.key_name
  subnet_id              = aws_subnet.subnet_le_saltstack.id
  vpc_security_group_ids = [aws_security_group.sg_le_saltstack_master.id]
  tags = {
    Name = "master_learning_saltstack"
  }
}
resource "aws_instance" "minion1_le_saltstack" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type_ubuntu
  #key_name               = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.sg_le_saltstack_master.id]
  subnet_id              = aws_subnet.subnet_le_saltstack.id
  tags = {
    Name = "minion1_learning_saltstack"
  }
}


resource "aws_key_pair" "keypair" {
  key_name   = "keypair_learning_saltstack"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCSTewr5KrqfQuwSO5I4jCAsFtYMq+9Sxf4kkB+DJk4RutxmhntBOxD4FRE6yoo/lk3KdxL0VPg0dEvovEXSmtyFS3sxUZv+MQvhF7UarPJ5TJCkQeeTWgHWSOMXhM55UGIXgVBoaDSELojxvdYoFLaC63CGA8FRLIifn+fXTli9Ma5K+bsjzOBquXKYAjLxK8UVh397pulqT5Oi5EPRqpfBdQKRAg8aLd5dpzBaMAQOx65kD3AvJHebpYK80nm3bDTQj+HpHdxFw2YbPIvx0AX5JWLEqAqTHALkgkqjyR4epWJMADjmPdNumHgqQPoaW9OivXsEq70hXlAXl07obF6dvvSVZPiT2JSe64Jc7zmcEc57t9Ze5dLNiIMVVa98UIuG/oreffxsjlAm6mCYvbTCWDz7csC3G0RQz+b/OysmmWlBV9XQGb2+I9TdGIuQ7renLB0tVnUC4TJXHfZ9deyLyxdR9KoquFj+axpVWGkqyI40PNCbcPo4BdKIR0d1b0= ubuntu@ip-172-31-22-109"
}


/*
resource "aws_instance" "minion2_le_saltstack" {
  ami                    = "ami-02584c1c9d05efa69"
  instance_type          = "t2.micro"
  #key_name               = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.sg_le_saltstack_master.id]
  subnet_id              = aws_subnet.subnet_le_saltstack.id
  tags = {
    Name = "minion2_learning_saltstack"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       
  public_key = tls_private_key.pk.public_key_openssh
}

public_ip_master = "3.72.61.252"
public_ip_minion1 = "3.125.40.210"
public_ip_minion2 = "3.127.36.127"*/

#master.pem:  43:ad:f7:19:81:c4:cd:55:03:d5:44:97:db:7c:ad:f2:83:7b:eb:c5:6d:f9:ac:db:75:ab:d9:53:80:8c:48:cf
#master.pub:  90:47:c4:03:87:da:b2:49:82:44:97:d4:2e:5c:8d:35:01:8a:e6:a9:49:47:58:7d:5f:09:77:10:34:9c:9b:af
