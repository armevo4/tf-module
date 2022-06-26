resource "aws_subnet" "my-pub-sub" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.pub_sub_cidr_block 
  map_public_ip_on_launch = true

  tags = {
    #Name = var.pub_sub_Name 
    Name = local.public-subnet-name
  }
}

resource "aws_subnet" "my-priv-sub" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = var.priv_sub_cidr_block

  tags = {
    #Name = var.priv_sub_Name
    Name = local.private-subnet-name
  }
}
