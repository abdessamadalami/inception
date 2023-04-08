#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wp downloaded"
else
	#Download wordpress and all config file
	wp core download --allow-root
	#env variable 
	sed -i "s/username_here/$USER/g" wp-config-sample.php
	sed -i "s/password_here/$PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	wp core install  --url=ael-oual.com --title="alah ishal amrk" --admin_name=$USER --admin_password=$PASS --admin_email=$Email --allow-root
	wp user create $USER $EMAIL --role=author --user_pass=$PASSWORD --allow-root
fi

exec "$@"