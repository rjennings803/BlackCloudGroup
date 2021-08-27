
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.black_cloud_group.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Black_public"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.black_cloud_group.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Black_private"
  }
}

resource "aws_route_table" "BCGPublicRT" {
  vpc_id = aws_vpc.black_cloud_group.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.BCGIGW.id

  }

}

resource "aws_route_table" "BCGPrivateRT" {
  vpc_id = aws_vpc.black_cloud_group.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.BCGnat.id

  }

}

resource "aws_route_table_association" "BCGPublicRTassociation" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.BCGPublicRT.id

}

resource "aws_route_table_association" "BCGPrivateRTassociation" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.BCGPrivateRT.id

}
