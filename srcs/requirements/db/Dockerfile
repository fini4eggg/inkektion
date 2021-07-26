FROM debian:buster

EXPOSE 3306

RUN apt-get update 
RUN apt-get install -y mariadb-server vim

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 444 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY db.sh      /var/www/
RUN chmod 755 /var/www/db.sh 
ENTRYPOINT ["bash", "/var/www/db.sh"]
