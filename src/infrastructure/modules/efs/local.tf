locals {
  subnet_ids = {
    private_3 = { subnet_id = var.subnet_ids.private_3 },
    private_4 = { subnet_id = var.subnet_ids.private_4 },
  }
}
