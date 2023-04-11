#!/bin/sh

	#status=1
	#while [ "$status" -ne "0" ]
	#do
	#	ping -c 1 mariadb
	#	status=$?
	#	sleep 1
	#	echo $status
	#done

if [ -f ./wp-config.php ]
then
	echo "wp downloaded"
else
	#Download wordpress and all config file
	wp core download --allow-root
	#env variable
	echo "I am here in here";
	sed -i "s/username_here/ael-oual/g" wp-config-sample.php
	sed -i "s/password_here/pass/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/wordpress/g" wp-config-sample.php


	cp wp-config-sample.php wp-config.php


	wp core install --url=example.com --title="My Site of my sitw " --admin_user=ael-oual --admin_password=ael-oual --admin_email=ael-oual@ael-oual.com --allow-root
	wp user create alami alami@gmail.com --role=author --user_pass=pass --allow-root
	echo "I am here in here";
fi
exec $@