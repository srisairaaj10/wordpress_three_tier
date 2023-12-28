resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name" = "wordpress_igw"
  }
}
