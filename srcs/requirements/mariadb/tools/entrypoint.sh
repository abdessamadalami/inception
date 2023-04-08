#!bin/bash
service mysql start;
echo "CREATE DATABASE IF NOT EXISTS wordpress ;" > s.sql;
#echo "CREATE USER IF NOT EXISTS '$USER'@'localhost' IDENTIFIED BY '$PASSWORD';" >> s.sql;
mysql < s.sql ;
#mysql -e "GRANT ALL PRIVILEGES ON '$DBNAME'.* TO '$USER'@'%';"
#mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'alami1234' ;"
#mysql -e "FLUSH PRIVILEGES;"
#kill $(cat /var/run/mysqld/mysqld.pid)
service mysql stop;


mysqld