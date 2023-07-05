FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server procps vim -y
RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld \
		&& chown mysql:mysql -R /var/lib/mysql/
RUN mysql_install_db --basedir /usr --datadir /var/lib/mysql --user mysql

COPY ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
