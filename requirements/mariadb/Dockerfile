FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server -y

COPY . .

RUN service mysql start

#CMD /bin/bash
CMD mysql start #mysql_secure_installation
#CMD ["mysql", "-h", "127.0.0.1", "-P", "3306", "--protocol=tcp"]
