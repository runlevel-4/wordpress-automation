#!/bin/sh

# Check if Debain is installed.  If it is, install the php repositories
if grep -q Debian "/etc/os-release" ; then
	echo "Debian is installed"
	echo
	echo "Installing Debian prerequisites"
	echo
	sudo apt update
	sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
	wget https://packages.sury.org/php/apt.gpg
	sudo apt-key add apt.gpg
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list
else
	echo "Not Debian...continuing"
fi

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
