FROM debian:buster

WORKDIR /wordpress

RUN apt-get update && apt -y install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath

RUN mkdir -p /var/www/html /run/php

COPY . .

CMD /usr/sbin/php-fpm7.3 --nodaemonize
