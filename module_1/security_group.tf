resource "aws_security_group" "sg_le_saltstack_master" {
  description = "open ssh from my local meachin to master end all egress"

  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_block_port_22
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block_subnet1]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
   Name = "sg_learning_saltstack_master"
  }
}

# resource "aws_security_group" "sg_le_saltstack_minion" {
#   description = "open ssh from my local meachin to master end all egress"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["${aws_instance.master_le_saltstack.public_ip}/32", var.local_computer_ip]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#     tags = {
#    Name = "sg_learning_saltstack_minions"
#   }
# }