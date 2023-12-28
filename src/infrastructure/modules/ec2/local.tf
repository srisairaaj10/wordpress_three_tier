locals {
  nodes = {
    node_1_bastion = {
      vpc_security_group_ids = [var.ssh_sg_id, var.wb_sg_id, var.lb_sg_id]
      subnet_id              = var.subnet_ids.public_1
      tags = {
        "Name" = "wordpress-bastion"
      }
    },

    node_1_private = {
      vpc_security_group_ids = [var.wb_sg_id, var.ssh_sg_id]
      subnet_id              = var.subnet_ids.private_1
      tags = {
        "Name" = "wordpress-private-wb-1"
      }
    },

    node_2_private = {
      vpc_security_group_ids = [var.wb_sg_id, var.ssh_sg_id]
      subnet_id              = var.subnet_ids.private_2
      tags = {
        "Name" = "wordpress-private-wb-2"
      }
    },
  }
}

locals {
  baseurl = "${path.module}/../../../config/"
}




