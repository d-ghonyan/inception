FROM debian:buster

WORKDIR /nginx

RUN apt-get -y update && apt-get -y install nginx sudo
RUN sudo service nginx start

COPY . .

CMD ["sudo", "nginx", "-t"]