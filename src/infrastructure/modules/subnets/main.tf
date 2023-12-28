resource "aws_subnet" "subnets" {
  for_each                = local.subnets
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone
  tags                    = each.value.tags
  vpc_id = var.vpc_id

}
