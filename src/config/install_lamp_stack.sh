#!/bin/bash



# Install Apache
sudo su
sudo yum update -y
sudo yum install -y httpd httpd-tools mod_ssl
sudo systemctl enable httpd 
sudo systemctl start httpd



# Install mdb

sudo amazon-linux-extras install mariadb10.5 -y
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Install PHP

sudo amazon-linux-extras install php7.4 -y
sudo yum install php-mbstring php-xml php-gd -y



sudo systemctl restart httpd
sudo systemctl restart php-fpm



# permission

sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
chown apache:apache -R /var/www/html 



