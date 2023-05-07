FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/nginx.crt \
        -keyout /etc/nginx/ssl/nginx.key \
        -subj "/C=FR/ST=Paris/L=Paris/O=worpress/CN=fassier.42.fr"


#nginx config
COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]


