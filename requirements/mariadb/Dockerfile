FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server procps vim -y
RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld
RUN mysql_install_db --basedir /usr --datadir /var/lib/mysql

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./entrypoint.sh ./entrypoint.sh
RUN mysqld && mysql -e "CREATE USER 'barev'@'localhost' IDENTIFIED BY '1'" &

#RUN mysql -e "UPDATE mysql.user SET Password = PASSWORD('1') WHERE User = 'root'"
#USER mysql
ENTRYPOINT ["./entrypoint.sh"]
