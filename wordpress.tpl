#!/bin/bash
yum update -y
yum install -y httpd php php-mysqlnd mysql git
systemctl start httpd
systemctl enable httpd
cd /var/www/html/
git clone https://github.com/WordPress/WordPress.git
mv WordPress/* .
rm -rf WordPress
chown apache:apache /var/www/html/ -R