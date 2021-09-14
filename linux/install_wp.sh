#!/bin/sh

# Perform updates
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

# Install web components
sudo apt install apache2 mysql-common mariadb-server php7.4 php7.4-mysql tar -y

# Download and install Wordpress
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz --no-check-certificate
sudo tar -xzvf latest.tar.gz

# Configuring database environment
echo
echo "If you don't have a root password for your MySQL instance, just press Enter:"
sudo mysql -u root -p < $HOME/wordpress-automation/linux/wp_mysql_setup.sql

#Setup Wordpress environment
sudo cp -r $HOME/wordpress-automation/linux/wp-config.php /var/www/html/wordpress/
sudo rm -rf /wordpress/wp-config-sample.php
sudo rm -rf latest.tar.gz
sudo chown -R www-data: /var/www/html/wordpress
echo
echo "Now visit http://ServerIP/wordpress/"
