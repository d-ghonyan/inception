#!/bin/sh

service mysql restart

sleep 5;

mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '1';
exit
EOF

sleep 100;

#service mysql stop

#/usr/sbin/mysqld
