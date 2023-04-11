#!bin/bash
if [ -f s.sql ]
then
	echo "configurate"
else
	service mysql start;
	echo "starting ......."
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > s.sql;
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> s.sql;
	echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> s.sql;
	mysql < s.sql ;
	#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'alami1234' ;"
	#kill $(cat /var/run/mysqld/mysqld.pid)
	echo "end conf ......."
fi
mysqld