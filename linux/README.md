# Wordpress Installer Script

This script will setup all of the prerequsite LAMP stack components and create a default WordPress database and DB user.

=====================================================================

**DEBIAN USERS START HERE**

Debian/Raspberry Pi users will have to add the 3rd party _sury_ repository in order to download the proper php packages before continuing.

`sudo apt update`

`sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https`

`wget https://packages.sury.org/php/apt.gpg`

`sudo apt-key add apt.gpg`

`echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list`

The script will run the update and upgrade commands.

=====================================================================

**OTHERWISE START HERE**

At the Linux command line:

1. If _git_ is not installed, just run `sudo apt install git`
2. `git clone https://github.com/edwardsj9090/wordpress-automation`
3. `sh wordpress-automation/linux/install_wp.sh`

======================================================================

**NOTE:** I recommend logging into MySQL/MariaDB and changing the root login as well as the password for the _wordpress_ user.  Then update the password value in your _wp-config.php_ file to match.  Do this only if you plan on exposing your server to the internet.

`sudo mysql -u root -p` (if you don't have a mysql password, just hit _Enter_)

`ALTER USER 'wordpress'@'localhost' IDENTIFIED BY 'newpassword';`
