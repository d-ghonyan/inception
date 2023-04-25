FROM debian:buster

WORKDIR /nginx

RUN apt-get -y update && apt-get -y install nginx sudo

COPY . .

RUN cp nginx_conf.sample /etc/nginx/sites-available/wordpress.conf
RUN sudo service nginx start

CMD nginx -g "daemon off;"
