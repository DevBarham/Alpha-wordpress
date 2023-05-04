sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y mysql-server
sudo apt-get install -y php
sudo apt-get install -y php-mysql
sudo systemctl restart apache2
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/*
sudo chmod -R 755 /var/www/html/*
sudo systemctl restart apache2
