#!/bin/sh

service mysql restart

sleep 5;

mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@localhost IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE DATABASE IF NOT EXISTS '$MYSQL_DATABASE';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';
exit
EOF

service mysql stop

sleep 5;

/usr/sbin/mysqld
