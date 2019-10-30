#VPC Endpint 필요할 경우 사용
resource "aws_vpc_endpoint" "vpc-endpoint-s3" {
  vpc_id       = "${aws_vpc.test-vpc.id}"
  service_name = "${var.s3-vpc-endpint-service-name}"
}

resource "aws_vpc_endpoint_route_table_association" "vpc-endpoint-prv-rt-a" {
  vpc_endpoint_id = "${aws_vpc_endpoint.vpc-endpoint-s3.id}"
  route_table_id  = "${aws_route_table.test-vpc-priavte-rt-a.id}"
}
resource "aws_vpc_endpoint_route_table_association" "vpc-endpoint-prv-rt-c" {
  vpc_endpoint_id = "${aws_vpc_endpoint.vpc-endpoint-s3.id}"
  route_table_id  = "${aws_route_table.test-vpc-priavte-rt-c.id}"
}
resource "aws_vpc_endpoint_route_table_association" "vpc-endpoint-pub-rt" {
  vpc_endpoint_id = "${aws_vpc_endpoint.vpc-endpoint-s3.id}"
  route_table_id  = "${aws_route_table.test-vpc-public-rt.id}"
}



