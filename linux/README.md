# Wordpress Installer Script

This script will setup all of the prerequsite LAMP stack components and create a default WordPress database and DB user.

=====================================================================

At the Linux command line do this from your `/home directory`:

1. If _git_ is not installed, just run `sudo apt install git`
2. `git clone https://github.com/runlevel-4/wordpress-automation`
3. `sh wordpress-automation/linux/install_wp.sh`

======================================================================

**NOTE:** I recommend logging into MySQL/MariaDB and changing the root login as well as the password for the _wordpress_ user.  Then update the password value in your _wp-config.php_ file to match.  Do this only if you plan on exposing your server to the internet.

`sudo mysql -u root -p` (if you don't have a mysql password, just hit _Enter_)

`ALTER USER 'wordpress'@'localhost' IDENTIFIED BY 'newpassword';`
