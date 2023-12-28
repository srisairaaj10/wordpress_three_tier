#!/bin/bash
sudo systemctl stop httpd
sudo mkdir -p /var/www/html/wordpress
sudo sed -i 's#DocumentRoot "/var/www/html"#DocumentRoot "/var/www/html/wordpress"#' /etc/httpd/conf/httpd.conf
sudo systemctl start httpd
