#!/bin/bash


cd wordpress
sudo cp wp-config-sample.php wp-config.php


# Update the wp-config.php file with the provided values
sudo sed -i "s/database_name_here/${db_name}/" wp-config.php
sudo sed -i "s/username_here/${username}/" wp-config.php
sudo sed -i "s/password_here/${password}/" wp-config.php
sudo sed -i "s/localhost/${endpoint}/" wp-config.php


cd /
sudo cp -r wordpress /var/www/html/
sudo systemctl start httpd


