FROM debian:buster
RUN apt-get update \
&& apt-get -y upgrade \ 
&& apt-get -y install nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d/
RUN mkdir /etc/nginx/ssl
RUN apt-get  install openssl && \
    openssl req -x509 -nodes -days 365\
    -newkey rsa:2048\
    -out /etc/nginx/ssl/vbachele.crt\
    -keyout /etc/nginx/ssl/vbachele.key \
 -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"
EXPOSE 443
CMD ["nginx", "-g" ,"daemon off;"]