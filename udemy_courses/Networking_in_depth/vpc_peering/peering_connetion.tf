resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = aws_vpc.vpc_b.id
  vpc_id        = aws_vpc.vpc_a.id
}

resource "aws_route" "rout_a" {
  route_table_id            = aws_route_table.pri_rt.id
  destination_cidr_block    = var.cidr_block_pri_sup_c
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id

}
resource "aws_route" "rout_b" {
  route_table_id            = aws_route_table.pri_rt_sub_c.id
  destination_cidr_block    = var.cidr_block_vpc_a
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id

}