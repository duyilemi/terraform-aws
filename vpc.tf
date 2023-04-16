module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.VPC_NAME
  cidr = var.VPC_CIDR
  azs  = [var.ZONE1, var.ZONE2, var.ZONE3]

  private_subnets = [var.PrivateSub1_CIDR, var.PrivateSub2_CIDR, var.PrivateSub3_CIDR]
  public_subnets  = [var.PublicSub1_CIDR, var.PublicSub2_CIDR, var.PublicSub3_CIDR]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "Production"
  }

  vpc_tags = {
    Name = var.VPC_NAME
  }
}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets[0]
}