data "aws_ami" "amazon-linux2-ami" {
  most_recent = true 
  owners = ["amazon"]

  filter {
    name   = "name"
    values = [
      "amzn2-ami-kernel-*-x86_64-gp2",
    ]
  }
}
output "amazon-linux2-ami-id" {
  value = data.aws_ami.amazon-linux2-ami.id
}


output "public-subnet-id" {
  value = module.vpc.public_subnets[0] 
}



data "aws_availability_zones" "my-az" {
  state = "available"
}
output "AvailabilityZones" {
  value = data.aws_availability_zones.my-az.names[2]
} 
output "Security_group" {
  value = aws_security_group.my-sg.ingress
} 
