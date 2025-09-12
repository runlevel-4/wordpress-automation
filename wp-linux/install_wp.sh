#!/bin/sh

# Install LAMP stack prerequisites
echo "Installing prerequisites"
echo
sudo apt update
sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https

# Perform updates
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

# Install web components
sudo apt install apache2 mariadb-common mariadb-server php8.4-common php8.4-mysql tar -y

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
