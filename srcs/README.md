version: '3'

networks:
  net:

services:
  mariadb:
    build: ./requirements/mariadb
    volumes:
      - mariadb_data:/var/lib/mysql
    env_file:
      - .env
    networks:
      - net
    restart: always

  wordpress:
    build: ./requirements/wordpress/
    volumes:
      - wordpress_data:/var/www/html
    networks:
      - net
    depends_on:
      - mariadb
    env_file:
      - .env
    links:
      - mariadb

  nginx:
    build: ./requirements/nginx
    volumes:
      - wordpress_data:/var/www/html
    ports:
      - 443:443
    networks:
      - net
    depends_on:
      - wordpress
      
volumes:
   wordpress_data:
      driver: local
      driver_opts:
         type: none
         o: bind
         device: /home/inception/data/wordpress
   mariadb_data:
      driver: local
      driver_opts:
         type: none
         o: bind
         device: /home/inception/data/mysql