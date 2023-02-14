FROM debian:buster

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server -y
RUN service mysql start

COPY . .

CMD tail -f
# CMD ["mysql", "-h", "localhost", "-P", "6306", "--protocol=tcp"]