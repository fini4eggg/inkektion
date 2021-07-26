#!bin/env bash

if ! [ -f "/var/www/html/wp-config.php" ]; then
	apt-get install curl -y
   	
	apt-get install mariadb-client -y
    
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  	
	chmod +x wp-cli.phar
    
	mv wp-cli.phar /usr/local/bin/wp
	
 	wp core download --locale=ru_RU --path=wp --allow-root 
	cd wp	
    
	wp core config --dbhost=${WORDPRESS_DB_HOST} --dbname=${MYSQL_WP_NAME} --dbuser=${MYSQL_USER_NAME} --dbpass=${MYSQL_USER_PASSWORD} --allow-root
    
	wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_N} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root

    
	wp user create --allow-root bryella2 bryella2@42.fr --role=author --user_pass=bryella2
    
	mv * /var/www/html/
fi

exec "$@"

