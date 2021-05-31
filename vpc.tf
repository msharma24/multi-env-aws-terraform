################################################################################
# VPC Module
################################################################################

module "spoke_vpc_a" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"


  name = "spoke_vpc_a"
  cidr = var.vpc_cidr

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner = "user"
  }

  vpc_tags = {
    Name = "spoke_vpc_a"
  }
}


