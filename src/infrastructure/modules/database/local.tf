locals {
  rds = {
    db_name  = aws_db_instance.wordpress_db.db_name
    password = aws_db_instance.wordpress_db.password
    username = aws_db_instance.wordpress_db.username
    endpoint = aws_db_instance.wordpress_db.endpoint
  }
}
