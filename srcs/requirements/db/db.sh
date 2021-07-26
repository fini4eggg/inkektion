#!bin/env bash
chown -R mysql:mysql /var/lib/mysql
if ! [ -d "var/lib/mysql/wp" ]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_NAME DEFAULT CHARACTER SET utf8;"
mysql -u root -e "CREATE USER '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_WP_NAME.* TO $MYSQL_USER_NAME@'%'"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $MYSQL_ROOT_PASSWORD
service mysql stop
fi

/usr/bin/mysqld_safe
