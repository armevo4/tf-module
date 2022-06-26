resource "aws_internet_gateway" "my-igw" {
  tags = {
    Name = var.igw_Name 
  }
}
resource "aws_internet_gateway_attachment" "attach1" {
  internet_gateway_id = aws_internet_gateway.my-igw.id
  vpc_id              = aws_vpc.dev-vpc.id
}

resource "aws_nat_gateway" "my-ngw" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.my-pub-sub.id

  tags = {
    Name = var.ngw_Name 
  }

  depends_on = [aws_internet_gateway.my-igw]
}