FROM debian:buster

WORKDIR /wordpress

RUN mkdir -p /var/www/html /run/php
RUN apt-get update && apt -y install wget less php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath

COPY ./wp-config.php .
COPY ./wp-cli.phar /bin/wp
COPY ./entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
