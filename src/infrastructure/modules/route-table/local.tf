locals {
  subnet_ids = {
    "private_subnet_ids-1" = [var.subnet_ids.private_1, var.subnet_ids.private_3]
    "private_subnet_ids-2" = [var.subnet_ids.private_2, var.subnet_ids.private_4]
    "public_subnet_ids"    = [var.subnet_ids.public_1, var.subnet_ids.public_2]

  }
}

locals {
  nat_ids = var.nat_ids
}


locals {
  route_tables = {
    private_table_1 = {
      tags = {
        "Name" = "wordpress_private_rt-1"
      }
    },
    private_table_2 = {
      tags = {
        "Name" = "wordpress_private_rt-1"
      }
    }
  }
}
