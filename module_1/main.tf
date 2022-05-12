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
  public_key = ""
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

