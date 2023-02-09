FROM debian:buster

WORKDIR /nginx

RUN apt -y update && apt -y install nginx sudo

COPY . .

CMD ["sudo", "service", "nginx", "status"]