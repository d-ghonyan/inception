FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-client mariadb-server -y

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
