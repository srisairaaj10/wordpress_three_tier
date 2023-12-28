# resource "aws_key_pair" "wordpress_key_private" {
#   key_name   = "terraform-key"
#   public_key = "terraform-key.pem"
# }
resource "aws_key_pair" "wordpress_key_private" {
  key_name   = "terraform-key"  # Name of the existing key pair
  public_key = "privatekey/terraform-key.pem"
}


data "template_file" "user_data_lamb" {
  template = file("${local.baseurl}install_lamp_stack.sh")
}


data "template_file" "user_data_wordpress" {
  template = file("${local.baseurl}install_wordpress.sh")
}

data "template_file" "user_data_mount_efs" {
  template = file("${local.baseurl}mount_efs.sh")

  vars = {
    efs_dns_name = var.efs_dns_name
  }
}



data "template_file" "user_data_rds" {
  template = file("${local.baseurl}rds.sh")

  vars = {
    db_name  = var.db.db_name
    password = var.db.password
    username = var.db.username
    endpoint = var.db.endpoint
  }
}

data "template_file" "user_data_apache"{
  template =file("${local.baseurl}apache.sh")
}

resource "aws_instance" "wordpress_bastion" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.wordpress_ami.id
  key_name                    = aws_key_pair.wordpress_key_private.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = local.nodes.node_1_bastion.vpc_security_group_ids
  subnet_id                   = local.nodes.node_1_bastion.subnet_id
  tags                        = local.nodes.node_1_bastion.tags
  user_data                   = join("\n", [data.template_file.user_data_lamb.rendered, data.template_file.user_data_wordpress.rendered, data.template_file.user_data_mount_efs.rendered, data.template_file.user_data_rds.rendered])



  root_block_device {
    volume_size = 10
  }
}



resource "aws_launch_configuration" "wordpress_private_config" {
  name                        = "wordpress private machine config"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.wordpress_key_private.key_name
  image_id                    = data.aws_ami.wordpress_ami.image_id
  security_groups             = [var.wb_sg_id]
  associate_public_ip_address = false

  user_data = join("\n", [data.template_file.user_data_lamb.rendered, data.template_file.user_data_mount_efs.rendered,data.template_file.user_data_apache.rendered])

  root_block_device {
    volume_size = 10
  }
}

resource "aws_autoscaling_group" "wordpress_auto_group" {
  name                 = "wordpress group"
  launch_configuration = aws_launch_configuration.wordpress_private_config.name
  min_size             = 2
  max_size             = 6
  vpc_zone_identifier  = [var.subnet_ids.private_1, var.subnet_ids.private_2]
  target_group_arns    = [var.wordpress_tg_arn]

}

