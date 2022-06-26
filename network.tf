module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = join("-", [terraform.workspace, "vpc"])
  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.my-az.names[2]]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
