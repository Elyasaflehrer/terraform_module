# resource "aws_customer_gateway" "customer_gw" {
#   bgp_asn    = 65000
#   ip_address = "3.250.36.199"
#   type       = "ipsec.1"

#   tags = {
#     Name = "VPC_B_CGW"
#   }
# }

# resource "aws_vpn_connection" "main" {
#   vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
#   customer_gateway_id = aws_customer_gateway.customer_gw.id
#   type                = "ipsec.1"
#   static_routes_only  = true
#   remote_ipv4_network_cidr = "10.100.0.0/16"
  
#   tags = {
#     Name = "VPC_A_VPC_B-VPN_Connection"
#   }
# }



resource "aws_customer_gateway" "cos_gw_openswan" {
  bgp_asn    = 65000
  ip_address = "3.70.127.5"
  type       = "ipsec.1"

  tags = {
   Name = "Costumer_GW_Openswan"
 }
}

resource "aws_vpn_connection" "example" {
  customer_gateway_id = aws_customer_gateway.cos_gw_openswan.id
  transit_gateway_id  = aws_ec2_transit_gateway.transit_gw.id
  type                = aws_customer_gateway.cos_gw_openswan.type
  static_routes_only  = true
  

    tags = {
   Name = "VPN_Connection_Openswan"
 }
}

