#!/bin/sh

service mysql restart

sleep 5

echo "UPDATE mysql.user SET Password=PASSWORD('1') WHERE User='root';" > barev

mysql < barev

#mysql -e "UPDATE mysql.user SET Password = PASSWORD('1') WHERE User = 'root'"
mysql -u root --password="1" << EOF
CREATE DATABASE wordpress;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'ROOT';
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
exit
EOF

service mysql stop

/usr/sbin/mysqld
