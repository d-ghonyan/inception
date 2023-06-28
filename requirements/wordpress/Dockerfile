FROM debian:buster

WORKDIR /wordpress

RUN apt-get update && apt -y install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath && mkdir -p /run/php

COPY ./fpm_conf /etc/php/7.3/fpm
#CMD /bin/bash

CMD /usr/sbin/php-fpm7.3 --nodaemonize
