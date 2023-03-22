#!/bin/bash
 
sudo apt update
sudo apt install php php-xml php-fpm libapache2-mod-php php-mysql php-gd php-imap php-curl php-mbstring mariadb-server -y
sudo service apache2 start
sudo service mysql start

cat << CD
============================================================================================
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Please type a commands to create database and exit:
create database aeh;
exit;
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
============================================================================================
CD
sudo mysql

cd /tmp
git clone https://github.com/devilajith/phppage.git
cat << Setup
********************************************************************************************============================================================================================
Setup a Password and Remember
Enter "Yes" to All
Finally Change the password on config.php
============================================================================================********************************************************************************************
Setup
sudo mysql_secure_installation
cd phppage/web
sudo mysql -u root  -p aeh < aeh.sql
cd ..
sudo mv web /var/www/html/web
cd /var/www/html
sudo chmod -R 777 web
cd web
sudo nano config.php
echo "Successfully Completed"
echo "Copy And Paste the URL to access login page    : http://127.0.0.1/web"
