#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wp downloaded"
else
	#Download wordpress and all config file
	wp core download --allow-root
	#env variable
	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASS/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php


	cp wp-config-sample.php wp-config.php


	wp core install --url=$DOMAIN_NAME --title="My Site " --admin_user=$WP_ADMIN --admin_password=$ADMIN_PASSWORD --admin_email=ael-oual@ael-oual.com --allow-root
	wp user create $USER  $EMAIL --role=author --user_pass=$USER_PASSWORD --allow-root

fi
exec $@