output "vpc_id" {
  value = aws_vpc.vpcs["wordpress_vpc"].id
}
