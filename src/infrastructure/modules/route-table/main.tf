resource "aws_route_table" "wordpress_private_rt" {
  for_each = local.route_tables
  vpc_id   = var.vpc_id
  tags     = each.value.tags
}

resource "aws_route" "internet_route" {
  route_table_id         = data.aws_route_table.wordpress_default_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

resource "aws_route" "nat_route-1" {
  route_table_id         = aws_route_table.wordpress_private_rt["private_table_1"].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.nat_ids.nat_id1
}

resource "aws_route" "nat_route-2" {
  route_table_id         = aws_route_table.wordpress_private_rt["private_table_2"].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.nat_ids.nat_id2
}

resource "aws_route_table_association" "wordpress_public_association" {
  count = length(local.subnet_ids.public_subnet_ids)

  route_table_id = data.aws_route_table.wordpress_default_route_table.id
  subnet_id      = local.subnet_ids.public_subnet_ids[count.index]
}

resource "aws_route_table_association" "wordpress_private_association-1" {
  count = length(local.subnet_ids.private_subnet_ids-1)

  route_table_id = aws_route_table.wordpress_private_rt["private_table_1"].id
  subnet_id      = local.subnet_ids.private_subnet_ids-1[count.index]
}

resource "aws_route_table_association" "wordpress_private_association-2" {
  count = length(local.subnet_ids.private_subnet_ids-2)

  route_table_id = aws_route_table.wordpress_private_rt["private_table_2"].id
  subnet_id      = local.subnet_ids.private_subnet_ids-2[count.index]
}
