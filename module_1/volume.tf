resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name_master
  volume_id   = aws_ebs_volume.ebs_val.id
  instance_id = aws_instance.master_le_saltstack.id
}
resource "aws_ebs_volume" "ebs_val" {
  availability_zone = var.az_1
  size              = var.device_size_master

   tags = {
    Name = "ebs_val_learning_saltstack"
  }
}