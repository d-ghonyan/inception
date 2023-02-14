FROM debian:buster

WORKDIR /wordpress

RUN apt-get update && apt-get -y install apache2 gnupg2 ca-certificates apt-transport-https software-properties-common -y
# RUN service apache2 start && ln -s '/lib/systemd/'
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt-get update -y && apt-get install php libapache2-mod-php php-pear php-cgi php-common php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

RUN cd /var/www/html && wget https://wordpress.org/latest.zip && unzip latest.zip && mv wordpress yourdomain.com
RUN cd yourdomain.com && cp wp-config-sample.php wp-config.php

COPY . .

CMD ["ls"]