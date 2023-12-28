output "auto_scaling_id" {
  value = aws_autoscaling_group.wordpress_auto_group.id
}

output "auto_scaling_name" {
  value = aws_autoscaling_group.wordpress_auto_group.name
}
