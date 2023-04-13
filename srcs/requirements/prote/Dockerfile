FROM debian:buster
RUN apt-get update \
&& apt-get -y upgrade \ 
&& apt-get -y install nginx

COPY index.nginx-debian.html /var/www/html/
COPY ./conf/nginx.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g" ,"daemon off;"]