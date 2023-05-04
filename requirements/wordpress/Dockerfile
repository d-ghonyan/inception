FROM debian:buster

WORKDIR /wordpress

RUN apt-get update && apt -y install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git

RUN mkdir -p /var/www/html /run/php

RUN cd /var/www/html && wget https://wordpress.org/latest.zip && unzip latest.zip && cd wordpress && cp wp-config-sample.php wp-config.php

COPY . .

CMD /usr/sbin/php-fpm7.3 --nodaemonize
