#!/bin/sh
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS alami ;"
mysql -u root -e "CREATE USER IF NOT EXISTS alami@'localhost' IDENTIFIED BY 'alami';"
mysql -u root -e "ALTER USER alami@'localhost' IDENTIFIED BY 'alami' ;"
#more test about the new password 
service  mysql restart