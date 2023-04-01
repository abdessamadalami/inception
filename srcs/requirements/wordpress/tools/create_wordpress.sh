#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wp downloaded"
else
	#Download wordpress and all config file
	wp core download --allow-root
	#env variable 
	sed -i "s/username_here/alami/g" wp-config-sample.php
	sed -i "s/password_here/abd/g" wp-config-sample.php
	sed -i "s/localhost/aaa/g" wp-config-sample.php
	sed -i "s/database_name_here/aaaa/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	wp core install  --url=ael-oual.com --title="Your Blog Title" --admin_name=wordpress_admin --admin_password=4Long --admin_email=you@example.com --allow-root
fi

exec "$@"