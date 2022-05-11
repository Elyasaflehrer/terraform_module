# terraform_module
bundle of terraform module

The module have created for learning saltstack, so it's very simple module



**Module details:**
vpc - one vpc,
subnet - one subnet,
internet gateway - connected to vpc,
route table - connceted to vpc and internet gateway,
aws_route_table_association - connected to subnet and route table,
security groupe - ingerss: port 22 specific ip, ingress open in subnet all port, egrees all,
instance - tow instance in a subnet and vpc. in one of them attach a 20 GB  volume,
aws_key_pair - just once for all instance,
aws_ebs_volume - nothing special
aws_volume_attachment - attaches to aws_ebs_volume,

**Variable:**
region - The region,
local_computer_ip - Me IP computer to connect via ssh to instances,
cidr_block_vpc - Literally,
cidr_block_subnet1 - Literally,
launch_public_ip - see the documantation,
az_1 - avalibility zone,
cidr_block_port_22 - Literally,
cidr_block_egress - Literally,
ami_ubuntu - Literally,
instance_type_ubuntu - Literaly,
device_name_master - Remember the module have created for saltstack,
device_size_master - Remember the module have created for saltstack,


