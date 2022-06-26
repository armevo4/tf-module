resource "aws_route_table" "my-pub-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = var.pub_rt_Name
  }
}

resource "aws_route_table" "my-priv-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-ngw.id
  }

  tags = {
    Name = var.priv_rt_Name 
  }
}

resource "aws_route_table_association" "my-priv-rta" {
  subnet_id      = aws_subnet.my-priv-sub.id
  route_table_id = aws_route_table.my-priv-rt.id
}

resource "aws_route_table_association" "my-pub-rta" {
  subnet_id      = aws_subnet.my-pub-sub.id
  route_table_id = aws_route_table.my-pub-rt.id
}