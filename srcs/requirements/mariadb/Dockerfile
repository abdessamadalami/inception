FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server

RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/entrypoint.sh /

#RUN chmod +x entrypoint.sh

EXPOSE 3306

#ENTRYPOINT [ "./entrypoint.sh"] 
CMD [ "bash","entrypoint.sh" ]