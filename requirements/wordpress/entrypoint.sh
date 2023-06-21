#!/bin/sh

if [ ! -f /var/www/html/index.php ]
then
	echo "Downloading wordpress";
	wp --allow-root --path=/var/www/html/ \
		--url=https://wordpress.org/latest.zip core download
fi

if [ ! -f /var/www/html/wp-config.php ]
then
	echo "Installing wordpress, creating users";
	wp --allow-root --path=/var/www/html config create \
		--dbuser="$WORDPRESS_DB_USER" --dbname="$WORDPRESS_DB_NAME" \
		--dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST"
	wp user create "$EDITOR_USERNAME" "$EDITOR_PASSWORD" --role=editor 
fi

sleep 15;

while ! wp --allow-root --path=/var/www/html/ \
		--url="$SITE_URL" --title="$SITE_TITLE" \
		--admin_user="ADMIN_USERNAME" --admin_password="$ADMIN_PASSWORD"\
		--admin_email="$ADMIN_EMAIL" core install
do
	echo "trying again in 5 seconds"
	sleep 5;
done

/usr/sbin/php-fpm7.3 --nodaemonize
