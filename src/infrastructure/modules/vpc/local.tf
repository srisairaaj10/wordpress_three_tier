locals {
  vpcs = {
    wordpress_vpc = {
      cidr_block           = var.vpc_cidr
      enable_dns_hostnames = var.dns_hostnames
      enable_dns_support   = var.dns_support
      tags = {
        "Name" = var.vpc_name
      }
    },
  }
}
