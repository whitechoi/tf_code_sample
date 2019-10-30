# VPC
resource "aws_vpc" "test-vpc" {
  cidr_block           = "${var.test-vpc-cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "TEST-VPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "test-vpc-igw" {
  vpc_id = "${aws_vpc.test-vpc.id}"

  tags {
    Name = "TEST-VPC-IGW"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "test-vpc-nat-a" {
  allocation_id = "${aws_eip.test-vpc-nat-eip-a.id}"
  subnet_id     = "${aws_subnet.test-vpc-subnet-public-a.id}"
  
  tags = {
    Name = "NATGateway-A"
  }
}

resource "aws_nat_gateway" "test-vpc-nat-c" {
  allocation_id = "${aws_eip.test-vpc-nat-eip-c.id}"
  subnet_id     = "${aws_subnet.test-vpc-subnet-public-c.id}"
  
  tags = {
    Name = "NATGateway-C"
  }
}

# NAT EIP
resource "aws_eip" "test-vpc-nat-eip-a" {
  vpc = true
  tags {
    Name = "TEST-VPC-NGW-EIP-A"
  }
}

resource "aws_eip" "test-vpc-nat-eip-c" {
  vpc = true
  tags {
    Name = "TEST-VPC-NGW-EIP-C"
  }
}


# Public Subnet
resource "aws_subnet" "test-vpc-subnet-public-a" {
  vpc_id            = "${aws_vpc.test-vpc.id}"

  cidr_block        = "${var.public-subnet-cidr-a}"
  availability_zone = "ap-northeast-2a"

  tags {
    Name = "TEST-VPC-SUBNET-PUBLIC-A"
  }
}

resource "aws_subnet" "test-vpc-subnet-public-c" {
  vpc_id            = "${aws_vpc.test-vpc.id}"
  
  cidr_block        = "${var.public-subnet-cidr-c}"
  availability_zone = "ap-northeast-2c"

  tags {
    Name = "TEST-VPC-SUBNET-PUBLIC-C"
  }
}

# Public Route Table
resource "aws_route_table" "test-vpc-public-rt" {
  vpc_id = "${aws_vpc.test-vpc.id}"
  
  # Routes
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-vpc-igw.id}"
  }
  
  lifecycle {
    ignore_changes = [ "route" ]
  }

  tags {
    Name = "TEST-VPC-PUBLIC-RT"
  }
}

# Public Route Table Subnet Association

resource "aws_route_table_association" "ap-northeast-2a-public" {
  subnet_id      = "${aws_subnet.test-vpc-subnet-public-a.id}"
  route_table_id = "${aws_route_table.test-vpc-public-rt.id}"
}

resource "aws_route_table_association" "ap-northeast-2c-public" {
  subnet_id      = "${aws_subnet.test-vpc-subnet-public-c.id}"
  route_table_id = "${aws_route_table.test-vpc-public-rt.id}"
}


# Private Subnet

resource "aws_subnet" "test-vpc-subnet-private-a" {
  vpc_id            = "${aws_vpc.test-vpc.id}"

  cidr_block        = "${var.private-subnet-cidr-a}"
  availability_zone = "ap-northeast-2a"

  tags {
    Name = "TEST-VPC-SUBNET-PRIVATE-A"
  }
}

resource "aws_subnet" "test-vpc-subnet-private-c" {
  vpc_id            = "${aws_vpc.test-vpc.id}"
  
  cidr_block        = "${var.private-subnet-cidr-c}"
  availability_zone = "ap-northeast-2c"

  tags {
    Name = "TEST-VPC-SUBNET-PRIVATE-C"
  }
}

# Private Route Table
resource "aws_route_table" "test-vpc-priavte-rt-a" {
  vpc_id = "${aws_vpc.test-vpc.id}"
  
  # Routes
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.test-vpc-nat-a.id}"
  }

  lifecycle {
    ignore_changes = [ "route" ]
  }
  
  tags {
    Name = "TEST-VPC-PRIVATE-RT-A"
  }
}

resource "aws_route_table" "test-vpc-priavte-rt-c" {
  vpc_id = "${aws_vpc.test-vpc.id}"
 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.test-vpc-nat-c.id}"
  }

  lifecycle {
    ignore_changes = [ "route" ]
  }

  tags {
    Name = "TEST-VPC-PRIVATE-RT-C"
  }
}

# Private Route Table Subnet Association
resource "aws_route_table_association" "ap-northeast-2a-private" {
  subnet_id      = "${aws_subnet.test-vpc-subnet-private-a.id}"
  route_table_id = "${aws_route_table.test-vpc-priavte-rt-a.id}"
}

resource "aws_route_table_association" "ap-northeast-2c-private" {
  subnet_id      = "${aws_subnet.test-vpc-subnet-private-c.id}"
  route_table_id = "${aws_route_table.test-vpc-priavte-rt-c.id}"
}

