# EC2 INSTANCES
resource "aws_instance" "instance_1" {
  ami                    = var.ami_instance
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_id     = aws_subnet.subnet1.id
  key_name               = aws_key_pair.key_pair_1.key_name
  associate_public_ip_address = var.associate_public_ip_address

   tags = {
   Name = "server1_alb_project"
  }
}

resource "aws_instance" "instance_2" {
  ami                    = var.ami_instance
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_id     = aws_subnet.subnet2.id
  key_name               = aws_key_pair.key_pair_1.key_name
  associate_public_ip_address = var.associate_public_ip_address

   tags = {
   Name = "server2_alb_project"
  }
}


# optional 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "key_pair_1" {
  key_name   = "key_pair_alb_project"
  public_key  = "your_public_key"
}
