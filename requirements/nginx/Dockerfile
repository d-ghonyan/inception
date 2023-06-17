FROM debian:buster

WORKDIR /nginx

RUN apt-get -y update && apt-get -y install nginx sudo
RUN mkdir /etc/nginx/certs

COPY default.conf /etc/nginx/conf.d/default.conf
COPY ssl_certificate.crt /etc/nginx/certs/ssl_certificate.crt
COPY ssl_certificate.key /etc/nginx/certs/ssl_certificate.key

#RUN cp nginx_conf.sample /etc/nginx/sites-available/wordpress.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
#RUN sudo service nginx start

CMD nginx -g "daemon off;"
