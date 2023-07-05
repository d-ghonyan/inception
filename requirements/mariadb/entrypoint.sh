#!/bin/sh

mysqld &

sleep 3;

if [ ! -d /var/lib/mysql/wordpress ]
then
mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
EOF
fi

sleep 2;

killall mysqld

mysqld --bind-address=:: --skip-networking=0 --port=3306
