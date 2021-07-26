FROM debian:buster

EXPOSE 443

RUN apt-get update 
RUN apt-get install -y vim nginx openssl

COPY ./conf/nginx.config /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/nginx.config /etc/nginx/sites-enabled
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
    -keyout /etc/ssl/nginx-selfsigned.key \
    -out /etc/ssl/nginx-selfsigned.crt \
    -subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=SCHOOL21/CN=bryella" 
CMD ["nginx", "-g", "daemon off;"]
