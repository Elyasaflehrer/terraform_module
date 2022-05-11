output "public_ip_master" {
    value = aws_instance.master_le_saltstack.public_ip
}

output "public_ip_minion1" {
    value = aws_instance.minion1_le_saltstack.public_ip
}

# output "public_ip_minion2" {
#     value = aws_instance.minion2_le_saltstack.public_ip
# }