resource "aws_db_subnet_group" "private_group" {
  name       = "database sub net group"
  subnet_ids = [var.subnet_ids.private_3, var.subnet_ids.private_4]
}



resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_name                = "wordpress_db"
  username               = "username"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.private_group.name
  skip_final_snapshot    = true

}
