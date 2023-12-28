output "lb_sg_id" {
  value = aws_security_group.load_balancer_sg.id
}


output "wb_sg_id" {
  value = aws_security_group.web_server_sg.id
}


output "db_sg_id" {
  value = aws_security_group.database_sg.id
}



output "efs_sg_id" {
  value = aws_security_group.efs_sg.id
}


output "ssh_sg_id" {
  value = aws_security_group.ssh_sg.id
}

