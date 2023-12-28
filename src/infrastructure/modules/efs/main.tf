resource "aws_efs_file_system" "wordpress_efs" {
  encrypted = false
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "Wordpress file system"
  }
}

resource "aws_efs_mount_target" "wordpress_mount_target" {
  for_each        = local.subnet_ids
  file_system_id  = aws_efs_file_system.wordpress_efs.id
  subnet_id       = each.value.subnet_id
  security_groups = [var.efs_sg_id]
}
