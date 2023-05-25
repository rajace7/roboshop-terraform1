module "vpc" {
  source = "git::https://github.com/rajace7/tf-module-vpc.git"

  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  enable_dns_support = true
  enable_dns_hostnames = true

}