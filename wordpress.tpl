#!/bin/bash

# Installing Apache, MySQL and PHP

sudo apt-get update
sudo apt-get install -y apache2 mysql-server php php-mysql

# Downloading and extracting WordPress

sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo rm -rf /var/www/html/*
sudo mv wordpress/* /var/www/html/

# Configuring MySQL database

sudo mysql -u root -e "CREATE DATABASE ${db}"
sudo mysql -u root -e "CREATE USER '${user}'@'localhost' IDENTIFIED BY '${pass}'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${db}.* TO '${user}'@'localhost'"
sudo mysql -u root -e "FLUSH PRIVILEGES"

# Wordpress Setup

cd /var/www/html/
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/${db}/g" wp-config.php
sudo sed -i "s/username_here/${user}/g" wp-config.php
sudo sed -i "s/password_here/${pass}/g" wp-config.php
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Install New theme

sudo wget "${theme}"
sudo unzip $(basename ${theme}) -d /var/www/html/wp-content/themes/
sudo wp theme activate $(basename ${theme})


# Restarting Apache

sudo systemctl restart apache2