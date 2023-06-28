FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-client mariadb-server -y

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./entrypoint.sh ./entrypoint.sh
#RUN service mysql start

ENTRYPOINT ["./entrypoint.sh"]
#CMD mysql start #mysql_secure_installation
#CMD ["mysql", "-h", "127.0.0.1", "-P", "3306", "--protocol=tcp"]
