#---------------VPC----------------#
variable "vpc_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}
variable "vpc_Name" {
  type    = string
  default = "vpc-aws"
}


#---------------Subnets----------------#
variable "pub_sub_cidr_block" {
  type    = string
  default = "192.168.1.0/24"
}
variable "pub_sub_Name" {
  type    = string
  default = "pub-sub-aws"
}
variable "priv_sub_cidr_block" {
  type    = string
  default = "192.168.2.0/24"
}
variable "priv_sub_Name" {
  type    = string
  default = "priv-sub-aws"
}


#---------------Gateways----------------#
variable "igw_Name" {
  type    = string
  default = "igw-aws"
}
variable "eip_Name" {
  type    = string
  default = "eip-aws"
}
variable "ngw_Name" {
  type    = string
  default = "ngw-aws"
}


#---------------Route Tables----------------#
variable "pub_rt_Name" {
  type    = string
  default = "pub-rt-aws"
}
variable "priv_rt_Name" {
  type    = string
  default = "priv-rt-aws"
}


