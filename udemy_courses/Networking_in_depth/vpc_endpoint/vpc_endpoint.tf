resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc_a.id
  service_name = "com.amazonaws.eu-central-1.s3"
  route_table_ids =[aws_route_table.route_table_vpc_b.id]

tags = {
    Name = "VPC-Endpoint"
  }

}