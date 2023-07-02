#!/bin/sh

if [ ! -f /var/www/html/index.php ]
then
	echo "Downloading wordpress";
	wp --allow-root --path=/var/www/html/ \
		--url=https://wordpress.org/latest.zip core download
fi

sleep 5;

mv ./wp-config.php /var/www/html/wp-config.php

while ! wp --allow-root --path=/var/www/html/ \
		--url="$SITE_URL" --title="$SITE_TITLE" \
		--admin_user="$ADMIN_USERNAME" --admin_password="$ADMIN_PASSWORD" \
		--admin_email="$ADMIN_EMAIL" core install
do
	echo "trying again in 5 seconds"
	sleep 5;
done

wp --allow-root --path=/var/www/html user create "$EDITOR_USERNAME" "idontcare@yourmomshouse.org" --user_pass="$EDITOR_PASSWORD" --role=editor 

/usr/sbin/php-fpm7.3 --nodaemonize
