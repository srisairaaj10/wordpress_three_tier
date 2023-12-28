resource "aws_eip" "wordpress_eip" {
  for_each = local.elastic_ips
  #vpc      = true
  tags = each.value.tags

}

resource "aws_nat_gateway" "wordpress-nat" {
  for_each      = local.nat_gateways
  allocation_id = each.value.allocation_id
  subnet_id     = each.value.subnet_id

  tags = each.value.tags
}
