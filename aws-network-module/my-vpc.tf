resource "aws_vpc" "dev-vpc" {
  cidr_block       = var.vpc_cidr_block 

  tags = {
    #Name = var.vpc_Name
    Name = local.vpc_name
  }
}
