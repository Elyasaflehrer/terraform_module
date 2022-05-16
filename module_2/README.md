# terraform_module
bundle of terraform module

The module have created for learning Application Load Balancer (ALB), with Certificate Manager (ACM) and Rout53



**Module details:**
vpc - one vpc,
subnet - two subnet,
internet gateway - connected to vpc,
route table - connceted to vpc and internet gateway,
aws_route_table_association - tow for each subnet attaching subnet to route table,
security groupe - ingerss: port 22 specific ip , HTTPS, HTTP, egrees all,
instance - tow instance once for each subnet
aws_key_pair - just once for all instance,
targate_grupe - create targate groupe for alb
aws_lb_target_group_attachment - attach instance to targate group
aws_lb - create Application Load Balancer
aws_lb_listener - two listener to alb one for HTTP protocol and one for HTTPS protocol
aws_acm_certificate - create certificate
data aws_route53_zone - use in exists domain
aws_route53_record - two (I should learining)
aws_acm_certificate_validation = validated your domain with the certifiate









**Variable:**
region 
region                      
common_tags                 
ami_instance              
instance_type               
associate_public_ip_address
load_balancer_type         
alb_subnets                 
security_groups             
cidr_block_route_table     
cidr_blocks_ssh             
cidr_blocks_egress          
cidr_block_subnet1          
cidr_block_subnet2          
region_subnet1             
region_subnet2              
cidr_block_vpc    
