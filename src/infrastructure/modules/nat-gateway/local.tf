locals {
  elastic_ips = {
    eip1 = {
      tags = {
        "Name" = "ip-1"
      }
    },
    eip2 = {
      tags = {
        "Name" = "ip-2"
      }
    }
  }
}


locals {
  nat_gateways = {
    nat1 = {
      allocation_id = aws_eip.wordpress_eip["eip1"].id
      subnet_id     = var.subnet_ids.public_1


      tags = {
        "Name" = "wordpress_ng-1"
      }
    },
    nat2 = {
      allocation_id = aws_eip.wordpress_eip["eip2"].id
      subnet_id     = var.subnet_ids.public_2


      tags = {
        "Name" = "wordpress_ng-2"
      }
    }
  }
}


locals {
  nat_ids = {
    nat_id1 = aws_nat_gateway.wordpress-nat["nat1"].id
    nat_id2 = aws_nat_gateway.wordpress-nat["nat2"].id
  }
}
