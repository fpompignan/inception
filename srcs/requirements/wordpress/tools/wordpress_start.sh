#!/bin/bash

	mkdir -p /var/www/html;
	adduser -u 82 -D -S -G www-data www-data;	
	chmod 777 -R /var/www/html;
	chown -R www-data:www-data /var/www/html;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};

	chown -R www-data:www-data /var/www/html/*;
	echo "Wordpress: set up!"
fi

exec "$@"
