locals {
  subnets = {
    "wordpress_subnet_public-1" = {
      cidr_block              = "10.0.0.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_one
      tags = {
        "Name" = "wordpress_subnet_public-1"
      }
    },
    "wordpress_subnet_public-2" = {
      cidr_block              = "10.0.1.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_two
      tags = {
        "Name" = "wordpress_subnet_public-2"
      }
    },
    "wordpress_subnet_private-1" = {
      cidr_block              = "10.0.2.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_one
      tags = {
        "Name" = "wordpress_subnet_private-1"
      }
    },
    "wordpress_subnet_private-2" = {
      cidr_block              = "10.0.3.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_two
      tags = {
        "Name" = "wordpress_subnet_private-2"
      }
    },

    "wordpress_subnet_private-3" = {
      cidr_block              = "10.0.4.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_one
      tags = {
        "Name" = "wordpress_subnet_private-3"
      }
    },

    "wordpress_subnet_private-4" = {
      cidr_block              = "10.0.5.0/24"
      map_public_ip_on_launch = true
      availability_zone       = var.zone_two
      tags = {
        "Name" = "wordpress_subnet_private-4"
      }
    }
  }
}



locals {
  subnet_ids = {
    public_1  = aws_subnet.subnets["wordpress_subnet_public-1"].id
    public_2  = aws_subnet.subnets["wordpress_subnet_public-2"].id
    private_1 = aws_subnet.subnets["wordpress_subnet_private-1"].id
    private_2 = aws_subnet.subnets["wordpress_subnet_private-2"].id
    private_3 = aws_subnet.subnets["wordpress_subnet_private-3"].id
    private_4 = aws_subnet.subnets["wordpress_subnet_private-4"].id
  }
}
