FROM debian:buster

WORKDIR /nginx

RUN apt-get -y update && apt-get -y install nginx
RUN mkdir /etc/nginx/certs

COPY certs/ssl_certificate.crt /etc/nginx/certs/ssl_certificate.crt
COPY certs/ssl_certificate.key /etc/nginx/certs/ssl_certificate.key

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

CMD nginx -g "daemon off;"
